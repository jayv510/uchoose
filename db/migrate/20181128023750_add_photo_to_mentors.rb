class AddPhotoToMentors < ActiveRecord::Migration[5.2]
  def change
    add_column :mentors, :photo, :string
  end
end
