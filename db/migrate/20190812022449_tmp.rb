class Tmp < ActiveRecord::Migration
  def change
     remove_column :orders, :user, :references
  end
end
