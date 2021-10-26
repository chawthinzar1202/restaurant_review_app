class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :require_login, except: [:index, :show]

  def index
    @users = User.all.alphabetical_order.page(params[:page]) 
    if params[:user_id]
      @reviews = User.find(params[:user_id]).reviews.page(params[:page])
    elsif params[:restaurant_id]
      @reviews = Restaurant.find(params[:restaurant_id]).reviews.page(params[:page])
      render :layout => false
    elsif params[:rating]
      if params[:rating] == "Excellent"
        @reviews = Review.top_reviews(params[:rating]).order_by_date_visited.page(params[:page])
      end
    else
      @reviews = Review.all.order_by_date_visited.page(params[:page])
    end
  end

  def show
    @current_restaurant ||= Restaurant.find_by(id: @review[:restaurant_id])
    @review.restaurant_id = @current_restaurant.id
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @review}
    end
    
  end

  def review_data
    review = Review.find(params[:id])
    render json: @review
  end

  def new
    @review = Review.new(user_id: params[:user_id])
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      render json: @review, status: 201 
    else
      flash.now[:alert] = "Save Review unsuccesful! Please try again!"
      render 'new'
    end
  end

  def update
    if @review.update(review_params)
      redirect_to @review, notice: "Review updated!"
    else
      flash.now[:alert] = "Review Update unsuccesful! Please try again!"
      render 'edit'
    end
  end

  def destroy
    @review.destroy
    redirect_to user_path(current_user), notice: "Review deleted!"
  end

  private
  def set_review
    @review = Review.find(params[:id])
  end

  def review_params 
    params.require(:review).permit(:user_id,
                                   :restaurant_name,
                                   :content,
                                   :rating,
                                   :date_visited,
                                   :cuisine_ids => [],
                                   :cuisines_attributes => [:name]
                                   ) 
  end

  
end