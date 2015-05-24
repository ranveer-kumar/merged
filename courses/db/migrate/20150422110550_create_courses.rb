class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :instructor_id
      t.text :title
      t.text :subtitle
      t.text :objectives
      t.integer :language_id
      t.integer :category_id
      t.integer :subcategory_id
      t.integer :level_id
      t.boolean :certificate
      t.text :lectures
      t.text :coursecontentjson
      t.integer :privacy_level
      t.text :coursephoto

      t.timestamps null: false
    end
  end
end
