class StaticPagesController < ApplicationController
  def generate
      auth_required
  	  @code = Token.new()

  end

  def private
  	  @code = params[:id]
      @url = request.protocol + request.host_with_port + url_for(users_path)+ "/" + @code
  end

  def userprofile
  end
end
