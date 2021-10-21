class RemoveCuisineFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :cuisine, :string
  end
end
