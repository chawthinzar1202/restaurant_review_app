class AddDateVisitedToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :date_visited, :datetime
  end
end
