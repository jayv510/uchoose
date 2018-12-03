class AddAverageReviewsToMentors < ActiveRecord::Migration[5.2]
  def change
    add_column :mentors, :average_mentor_review, :float
  end
end
