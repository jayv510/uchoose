class AddPhotoToProspectives < ActiveRecord::Migration[5.2]
  def change
    add_column :prospectives, :photo, :string
  end
end
