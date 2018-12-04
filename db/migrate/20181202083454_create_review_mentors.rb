class CreateReviewMentors < ActiveRecord::Migration[5.2]
  def change
    create_table :review_mentors do |t|
      t.text :content
      t.integer :rating
      t.references :mentor, foreign_key: true

      t.timestamps
    end
  end
end
