class AddFieldToUser < ActiveRecord::Migration
  def change
    add_column :users, :mobile, :decimal
  end
end
