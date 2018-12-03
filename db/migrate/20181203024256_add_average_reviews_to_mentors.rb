class AddAverageReviewsToMentors < ActiveRecord::Migration[5.2]
  def change
    add_column :mentors, :average_review, :integer
  end
end
