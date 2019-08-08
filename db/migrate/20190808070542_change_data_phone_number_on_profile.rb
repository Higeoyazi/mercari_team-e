class ChangeDataPhoneNumberOnProfile < ActiveRecord::Migration[5.2]
  def change
    change_column :profiles, :phone_number, :integer
  end
end
