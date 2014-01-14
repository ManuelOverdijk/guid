class UsersController < ApplicationController
  def new
  	@user = User.new(:role => "agent")
  end

  def show
    
    token_url = Token.find_by_token(Token.encrypt_hash(params[:id]))
    if token_url && token_url.created_at > (token_url.timevalid).hours.ago
      @user = User.find(token_url.user_id)
    else
      redirect_to root_path
    end
  end

  def create
	  params.permit!

		@user = User.new(params[:user])
		if @user.save
		  redirect_to new_session_path, notice: 'Sign up complete. Please check your inbox for activation email.'
		else
	    #render action: "new"
      redirect_to generate_path
		end
  end

  def activate
    @user = User.find_by_activation_code(params[:code])
    @user.activation_code = nil
    if @user.save
      redirect_to new_session_path, notice: "Activation complete. Welcome #{@user.email}"
    else
      render action: "new"
    end
  end
end

