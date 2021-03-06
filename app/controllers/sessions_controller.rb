class SessionsController < ApplicationController
  def new
  end

  def create
    session_params = params[:sessions]
    
    user = login(session_params[:email],
                 session_params[:password],
                 session_params[:remember_me]
                 )
    if user
      redirect_to session[:return_to] || root_path, notice: 'Logged in!'
    else
      flash.alert = 'Username or password was invalid'
      redirect_to login_path
    end
  end

  def destroy
    logout
    redirect_to root_url, notice: 'Logged out!'
  end
end
