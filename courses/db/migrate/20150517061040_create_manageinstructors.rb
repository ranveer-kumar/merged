class CreateManageinstructors < ActiveRecord::Migration
  def change
    create_table :manageinstructors do |t|

      t.timestamps null: false
    end
  end
end
