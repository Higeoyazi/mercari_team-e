class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      add_column :profiles, :profile, :text, null: false
      add_column :profiles, :family_name, :string, null: false
      add_column :profiles, :first_name, :string, null: false
      add_column :profiles, :family_name_kana, :string, null: false
      add_column :profiles, :first_name_kana, :string, null: false
      add_column :profiles, :phone_number, :string, null: false
      t.timestamps
    end
  end
end
