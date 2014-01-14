class StaticPagesController < ApplicationController
  def generate
      auth_required
  	  @code = Token.new()

  end

  def private
  	  @code = params[:id]
  end

  def userprofile
  end
end
