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

  def index
  	@static_pages = Token.paginate(page: params[:page], :per_page => 10, :order => 'created_at DESC')
  end

  def delete

  end

end
