class TokensController < ApplicationController
	def new
	end

	def create
		privatehash = SecureRandom.uuid()
    time_to_seconds = params[:token][:timevalid] * 3600
		@token = Token.new(timevalid: time_to_seconds, token: privatehash, 
                        user_id: session[:user_id])

		if @token.save!
			redirect_to private_path(:id => @token.token)
		else
			redirect_to generate_path
		end
	end
end
