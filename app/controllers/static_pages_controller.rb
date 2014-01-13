class StaticPagesController < ApplicationController
  def generate
      auth_required
  	  @code = Token.new()
  end

  def private
  	  @code = params[:id]

  	  #check if token is valid
  	  if @found_token = Token.find_by_token(@code)
	  	  @timevalid = @found_token.timevalid
	  	 if (Time.now - @found_token.created_at) < @timevalid

	  	  		#redirect_to profile_path
	  	  		@test = @found_token.created_at.to_s
	  	  else
	  	  		@test = "not valid"
	  	  # 	 	redirect_to private_path
	  	  end
	  end
  end

  def userprofile
  end
end
