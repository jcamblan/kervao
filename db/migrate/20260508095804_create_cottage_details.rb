class CreateCottageDetails < ActiveRecord::Migration[8.1]
  def change
    create_table :cottage_details do |t|
      t.references :cottage, null: false, foreign_key: true
      t.integer :position, default: 0, null: false
      t.jsonb :translations, default: {}, null: false

      t.timestamps
    end
  end
end
