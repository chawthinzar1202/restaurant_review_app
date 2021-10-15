class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    skip_before_action only: [:home, :new, :create]
    before_action :correct_user, only: [:edit, :update, :destroy]
  
    def home
    end

    def index
       
    end
 
end
