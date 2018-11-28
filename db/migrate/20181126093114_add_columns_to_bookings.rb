class AddColumnsToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :start_datetime, :datetime
    add_column :bookings, :start_endtime, :datetime
    add_column :bookings, :total_cost, :decimal
  end
end
