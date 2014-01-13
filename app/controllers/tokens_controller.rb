class TokensController < ApplicationController
	def new
		@token = Token.new
	end
	def create
		@token = Token.new(user_params)
		if @token.save
			redirect_to private_path
		else
			redirect_to generate_path
		end
	end

private
	def user_params
		params.require(:code)
	end
end
