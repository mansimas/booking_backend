class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.date :start_at
      t.date :end_at
      t.string :client_email
      t.float :price
      t.references :rental, foreign_key: true

      t.timestamps
    end
  end
end
