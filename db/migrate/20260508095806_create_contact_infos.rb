class CreateContactInfos < ActiveRecord::Migration[8.1]
  def change
    create_table :contact_infos do |t|
      t.string :phone_number
      t.string :email
      t.jsonb :translations, default: {}, null: false

      t.timestamps
    end
  end
end
