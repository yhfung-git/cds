class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.integer :start_time
      t.integer :end_time
      t.references :user, null: false, foreign_key: true
      t.references :cd, null: false, foreign_key: true

      t.timestamps
    end
  end
end
