class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
    	t.belongs_to :user
    	t.belongs_to :listing
    	t.date :start_date
    	t.date :end_date
    	t.timestamp
    end
  end
end
