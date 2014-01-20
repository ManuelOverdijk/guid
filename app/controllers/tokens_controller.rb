require 'time'
require 'active_support'

class TokensController < ApplicationController
	def new
	end

	def create
		privatehash = SecureRandom.uuid()
		puts params[:token]
		dag, maand, jaar = params[:token][:datevalid].split('/')
		uren, minuten = params[:token][:timevalid].split(':')
		input = "#{jaar}-#{maand}-#{dag} #{uren}:#{minuten}:00"

		#datestamp = params[:token][:datevalid] + " " + params[:token][:timevalid]
		#puts datestamp
		@token = Token.new(timevalid: DateTime.parse(input), token: privatehash, 
                    user_id: session[:user_id]) 

		if @token.save!
			redirect_to private_path(:id => privatehash)
		else
			redirect_to generate_path, :notice => "Token could not be saved in db"
		end

	end

end

