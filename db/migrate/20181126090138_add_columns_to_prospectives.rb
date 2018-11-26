class AddColumnsToProspectives < ActiveRecord::Migration[5.2]
  def change
    add_column :prospectives, :first_name, :string
    add_column :prospectives, :last_name, :string
    add_column :prospectives, :nationality, :string
  end
end
