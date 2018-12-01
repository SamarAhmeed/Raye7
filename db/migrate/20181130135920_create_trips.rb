class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.references :user, foreign_key: true
      t.references :source
      t.references :destination
      t.datetime :time
      t.integer :numberOfSeats

      t.timestamps
    end
  end
end
