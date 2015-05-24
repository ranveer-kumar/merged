class CreateCoursefeedbacks < ActiveRecord::Migration
  def change
    create_table :coursefeedbacks do |t|

      t.timestamps null: false
    end
  end
end
