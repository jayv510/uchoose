class AddColumnsToMentors < ActiveRecord::Migration[5.2]
  def change
    add_column :mentors, :first_name, :string
    add_column :mentors, :last_name, :string
    add_column :mentors, :nationality, :string
    add_column :mentors, :university, :string
    add_column :mentors, :major, :string
    add_column :mentors, :degree_level, :string
    add_column :mentors, :description, :text
    add_column :mentors, :rate, :integer

  end
end
