class Restaurant < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews

    before_save { self.name = name.upcase_first }
  
  def restaurant_name
    self.restaurant.name if self.restaurant
  end

  def restaurant_name=(name)
     self.restaurant = Restaurant.find_or_create_by(name: name)
  end

  
end
