class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]
  before_action except: [:index, :show]

  def index
    
  end

  def show
     
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end
end
