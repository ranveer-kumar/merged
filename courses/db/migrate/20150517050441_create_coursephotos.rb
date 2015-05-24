class CreateCoursephotos < ActiveRecord::Migration
  def change
    create_table :coursephotos do |t|
      t.integer :course_id
      t.text :photo_url

      t.timestamps null: false
    end
  end
end
