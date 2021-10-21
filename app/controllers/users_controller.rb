class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, only: [:home, :new, :create]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def home
  end

  def index
    @users = User.all.alphabetical_order.page(params[:page])
  end

  def show
    @reviews = @user.reviews
    
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to '/', success: "Signup successful!"
    else
      render :new
    end
  end

  def update
    
  end

  def destroy
     
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email,
                                   :password,
                                   :password_confirmation)
    end

    def correct_user 
      @user = User.find(params[:id])
      redirect_to user_path(current_user),
      alert: "Sorry NO access to that page!" unless current_user?(@user)
    end
end
