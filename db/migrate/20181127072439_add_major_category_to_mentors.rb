class AddMajorCategoryToMentors < ActiveRecord::Migration[5.2]
  def change
    add_column :mentors, :major_category, :string
  end
end
