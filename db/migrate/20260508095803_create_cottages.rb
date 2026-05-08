class CreateCottages < ActiveRecord::Migration[8.1]
  def change
    create_table :cottages do |t|
      t.string :reference, null: false
      t.string :surface
      t.integer :room_count, default: 0, null: false
      t.integer :beddings, default: 0, null: false
      t.integer :washroom_count, default: 0, null: false
      t.integer :parking_lot_count, default: 0, null: false
      t.boolean :disabled_access, default: false, null: false
      t.integer :position, default: 0, null: false
      t.jsonb :translations, default: {}, null: false

      t.timestamps
    end

    add_index :cottages, :reference, unique: true
    add_index :cottages, :translations, using: :gin
  end
end
