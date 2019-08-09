class ChangeBuildingColumnOnProfile < ActiveRecord::Migration[5.2]
  def change
    change_column_null :addresses, :building, true
  end
end
