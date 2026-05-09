class CreateHomePages < ActiveRecord::Migration[8.1]
  def change
    create_table :home_pages do |t|
      t.jsonb :translations, default: {}, null: false

      t.timestamps
    end
  end
end
