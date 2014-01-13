class TokensController < ApplicationController
	def new
	end

	def create
		privatehash = SecureRandom.uuid();
		@token = Token.new(timevalid: params[:token][:timevalid], token: privatehash)

		if @token.save!
			redirect_to private_path(:id => @token.token)
		else
			redirect_to generate_path
		end
	end
end
