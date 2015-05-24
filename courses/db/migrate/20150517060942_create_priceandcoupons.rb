class CreatePriceandcoupons < ActiveRecord::Migration
  def change
    create_table :priceandcoupons do |t|

      t.timestamps null: false
    end
  end
end
