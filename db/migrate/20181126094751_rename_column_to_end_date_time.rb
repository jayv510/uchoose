class RenameColumnToEndDateTime < ActiveRecord::Migration[5.2]
  def change
    rename_column :bookings, :start_endtime, :end_datetime
  end
end
