class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      session[:user_id]= @user.id
      redirect_to bands_path
    else
      @errors = []
      @errors << "Credentials don't match our records."
      render "new"
    end
  end

  def destroy
    session[:user_id]=nil
    redirect_to login_path
  end

end
