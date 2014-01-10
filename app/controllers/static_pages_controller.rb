class StaticPagesController < ApplicationController
  def generate
  	  @code = SecureRandom.uuid()
  end

  def private
  	  @code = params[:code]
  end
end
