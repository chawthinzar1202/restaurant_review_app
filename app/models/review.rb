class Review < ApplicationRecord
    belongs_to :user
    belongs_to :restaurant
    
    
    before_save { self.restaurant_name = restaurant_name.upcase_first }
    def restaurant_name 
      self.restaurant.name if self.restaurant
    end
  
    def restaurant_name=(name) 
       self.restaurant = Restaurant.find_or_create_by(name: name) 
    end
  
end
