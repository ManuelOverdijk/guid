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
		@token = Token.new(timevalid: DateTime.parse(input), token: privatehash, 
                    user_id: session[:user_id]) 

		if @token.save!
			redirect_to private_path(:id => privatehash)
		else
			redirect_to generate_path, :notice => "Token could not be saved in db"
		end
		#current date
		# puts DateTime.now.to_date
		# if Date.parse(params[:token][:timevalid]) < Date.today
			#Date picked before today, raise error


			#Update database with new time valid until

			






		# if params[:token][:timevalid] == "1"
		# 	@timevalid = 7*24
		# end
		# if params[:token][:timevalid] == "2"
		# 	@timevalid = 2*7*24
		# else params[:token][:timevalid] == "3"
		# 	@timevalid = 4*7*24
		# end



		# @token = Token.new(timevalid: @timevalid, token: privatehash, 
  #                      user_id: session[:user_id])

		# if @token.save!
		# 	redirect_to private_path(:id => privatehash)
		# else
		# 	redirect_to generate_path
		# end
	end
end
