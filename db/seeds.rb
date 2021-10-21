# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do |n|
    email = Faker::Internet.unique.safe_email
    password = "password"
    password_confirmation = "password"
    user = User.create!(email:                 email,
                 password:              password,
                 password_confirmation: password)
    restaurant_name = Faker::Company.name
    content =  Faker::Lorem.paragraph(3, true, 3)
    cuisine_name = ["Chinese", "Thai", "Steak", "Pizza", "Italian", "Fine Dining"].sample
    review_cuisine = Cuisine.find_or_create_by :name => cuisine_name
    date_visited = Faker::Date.backward(125)
    rating = ["Excellent", "Good", "Average", "Poor"].sample
    Review.create!(user: user,
                  :cuisines => [review_cuisine],
                  restaurant_name: restaurant_name,
                  content: content,
                  date_visited: date_visited,
                  rating: rating)
  end
  
  5.times do |n|
    email = Faker::Internet.unique.safe_email
    password = "password"
    password_confirmation = "password"
    user = User.create!(email:                 email,
                 password:              password,
                 password_confirmation: password)
    2.times do |n|
      restaurant_name = ["McDonalds", "Burger King", "Wendy's", "Saizeriya", "Subway", "Lotteria", "KFC", "Mos Burger", "Red Robin", "IHOP", "Denny's"].sample
      content =  Faker::Lorem.paragraph(3, true, 3)
      cuisine_name = ["Burgers", "Sandwiches", "Fast Food", "American", "Diner"].sample
      review_cuisine = Cuisine.find_or_create_by :name => cuisine_name
      date_visited = Faker::Date.backward(90)
      rating = ["Excellent", "Good", "Average", "Poor"].sample
      Review.create!(user: user,
                :cuisines => [review_cuisine],
                restaurant_name: restaurant_name,
                content: content,
                date_visited: date_visited,
                rating: rating)
    end
  end
  