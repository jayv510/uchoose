class AddProspectiveIDtoReviewMentors < ActiveRecord::Migration[5.2]
  def change
     add_reference :review_mentors, :prospective, foreign_key: true
  end
end
