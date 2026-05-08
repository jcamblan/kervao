class CreatePricingRates < ActiveRecord::Migration[8.1]
  def change
    create_table :pricing_rates do |t|
      t.references :pricing_period, null: false, foreign_key: true
      t.references :cottage, null: false, foreign_key: true
      t.decimal :price, precision: 8, scale: 2, null: false

      t.timestamps
    end

    add_index :pricing_rates, %i[pricing_period_id cottage_id], unique: true
  end
end
