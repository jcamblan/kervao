class CreatePricingPeriods < ActiveRecord::Migration[8.1]
  def change
    create_table :pricing_periods do |t|
      t.references :pricing, null: false, foreign_key: true
      t.integer :position, default: 0, null: false
      t.jsonb :translations, default: {}, null: false

      t.timestamps
    end
  end
end
