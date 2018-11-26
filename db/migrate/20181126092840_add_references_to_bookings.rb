class AddReferencesToBookings < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :prospectives, foreign_key: true
    add_reference :bookings, :mentors, foreign_key: true
  end
end
