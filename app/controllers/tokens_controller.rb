class TokensController < ApplicationController
	def new
		@token = Token.new
	end

	def create
		puts params[:code]
		# @token = Token.new(params[:code])

		# if @token.save!

		# else
		# 	render 'private'
		# end

		# #@token = Token.create(token: params[:token], valid_time: params[:token][:valid_time])
		# if @token.save!
		# 	redirect_to private_path(:id => @token.token)
		# else
		# 	redirect_to generate_path
		# end
	end

	private
	  def token_params
	  	params.require(:tok)
	  end
end
