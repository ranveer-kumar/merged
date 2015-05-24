class CreateCourseprivacies < ActiveRecord::Migration
  def change
    create_table :courseprivacies do |t|

      t.timestamps null: false
    end
  end
end
