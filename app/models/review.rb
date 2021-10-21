class Review < ApplicationRecord
  belongs_to :user
  belongs_to :restaurant
  has_many :review_cuisines 
  has_many :cuisines, through: :review_cuisines
  

  before_save { self.restaurant_name = restaurant_name.upcase_first }

  validates_presence_of :restaurant_name, :date_visited, :rating

  validates :content, presence: true, length: { minimum: 10 }

  def restaurant_name
    self.restaurant.name if self.restaurant
  end

  def restaurant_name=(name) 
     self.restaurant = Restaurant.find_or_create_by(name: name)
  end

  def cuisines_attributes=(cuisine_attributes) 
    cuisine_attributes.values.each do |cuisine_attribute| 
      cuisine = Cuisine.find_or_create_by(cuisine_attribute)
      self.cuisines << cuisine
    end
  end

  def self.by_user(user_id) 
    where(user: user_id)
  end

  def self.top_reviews(rating) 
    where(rating: "Excellent")
  end

  def self.order_by_date_visited
    Review.order(date_visited: :desc)
  end
end
