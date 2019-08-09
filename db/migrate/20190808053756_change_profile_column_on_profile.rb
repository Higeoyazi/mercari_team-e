class ChangeProfileColumnOnProfile < ActiveRecord::Migration[5.2]
  def change
    change_column_null :profiles, :profile, true
  end
end
