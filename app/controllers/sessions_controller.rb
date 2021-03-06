class SessionsController < ApplicationController
  def new
  end

 #create and destroy methods are used when a user logs in and logs out respectively
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password]) 
    session[:user_usertype] = user.usertype
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    flash[:notice] = 'You have been logged out'

    redirect_to root_url
  end

end
