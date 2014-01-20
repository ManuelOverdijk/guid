require 'time'
require 'active_support'

class TokensController < ApplicationController
	def new
	end

	def create
    if params[:token][:datevalid].nil? ||params[:token][:timevalid]
      redirect_to generate_path, :flash => { :warning => "Please pick a date and time" }
    else
		  privatehash = SecureRandom.uuid()
		  dag, maand, jaar = params[:token][:datevalid].split('/')
		  uren, minuten = params[:token][:timevalid].split(':')
		  input = "#{jaar}-#{maand}-#{dag} #{uren}:#{minuten}:00"

		  @token = Token.new(timevalid: DateTime.parse(input), token: privatehash, 
                      user_id: session[:user_id]) 

		  if @token.timevalid < (DateTime.now.to_i + 3600)
			  redirect_to generate_path, :flash => { :warning => "Given date is not in the future"}
      elsif
        @token.save!
			  redirect_to private_path(:id => privatehash)
		  else
			  redirect_to generate_path, :flash => { :warning => "Token could not be saved in db" }
		  end
    end
	end

  def clean_database
    Token.where("timevalid < ?", DateTime.now.to_i + 3600).each do |token|
      token.destroy
    end
  end

	def destroy
		puts params
		Token.where(Token.token = @token_hash).destroy
		redirect_to(tokens_url)
	end
end

