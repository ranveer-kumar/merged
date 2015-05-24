class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.text :title
      t.text :description
      t.integer :level_id
      t.text :contenturl
      t.timestamps null: false
    end
  end
end
