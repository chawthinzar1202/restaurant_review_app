class ReviewsController < ApplicationController
    before_action :set_review, only: [:show, :edit, :update, :destroy]
    before_action except: [:index, :show]

  def index

  
  end

  def show
    
  end

  def new
    @review = Review.new(user_id: params[:user_id])
  end

  private
  def set_review
    @review = Review.find(params[:id])
  end

  def review_params #strong params tell which attrs permitted into controller actions SECURES against bad data
    params.require(:review).permit(:user_id,
                                   :restaurant_name,
                                   :content,
                                   :rating,
                                   :date_visited,
                                   :cuisine_ids => [],
                                   :cuisines_attributes => [:name]
                                   ) #ALT: cuisine_ids:[], cuisines_attributes: [:name]
  end
  
end