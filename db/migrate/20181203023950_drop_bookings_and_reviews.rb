class DropBookingsAndReviews < ActiveRecord::Migration[5.2]
  def change
    drop_table :bookings, force: :cascade
    drop_table :reviews, force: :cascade
  end
end
