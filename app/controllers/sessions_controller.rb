class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      reset_session
      log_in_user user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out_user
    redirect_to root_url
  end

  private
  def log_in_user(user)
    session[:user_id] = user.id
  end

  def log_out_user
    reset_session
    @current_user = nil
  end
end
