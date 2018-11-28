class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.decimal :longitude
      t.decimal :latitude

      t.timestamps
    end
    add_index :places, :name, unique: true
    add_index :places, [:longitude, :latitude], unique: true
  end
end
