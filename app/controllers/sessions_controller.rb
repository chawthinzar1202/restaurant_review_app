class SessionsController < ApplicationController

    skip_before_action only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user_path(current_user), notice: "Login successful!" 
    else
      flash.now[:alert] = "Login unsuccesful! Please try again or signup!" 
      render :new 
    end
      
  end

  def destroy
    log_out
    redirect_to login_path, notice: "Log out successful!"
  end

end
