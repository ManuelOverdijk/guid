class StaticPagesController < ApplicationController
  def generate
  	  @token = Token.new()
  	  #@code = SecureRandom.uuid()
  end

  def create

  end

  def private
  	  @code = params[:id]

  	  #check if token is valid
  	  @found_token = Token.find_by_token(@code)
  	  if @found_token && (Time.now - @found_token.created_at) < 6

  	  		#redirect_to profile_path
  	  		@test = @found_token.created_at.to_s
  	  else
  	  		@test = "not valid"
  	  # 	 	redirect_to private_path
  	  end
  end

  def userprofile
  end
end
