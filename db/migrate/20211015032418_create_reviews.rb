class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.text :content 
      t.string :cuisine
      t.string :rating
      t.datetime :review_date

      t.references :user, foreign_key: true 
      t.references :restaurant, foreign_key: true 

      t.timestamps null: false
    end
  end
end
