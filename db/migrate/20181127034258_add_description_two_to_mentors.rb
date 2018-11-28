class AddDescriptionTwoToMentors < ActiveRecord::Migration[5.2]
  def change
    add_column :mentors, :description_two, :text
  end
end
