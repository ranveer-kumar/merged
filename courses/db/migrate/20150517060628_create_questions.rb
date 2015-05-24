class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question_text
      t.text :question_desc
      t.text :subtitle
      t.integer :question_type_id
      t.integer :question_grade
      t.boolean :randomise
      t.text :question_media
      t.text :answer_feedback
      t.timestamps null: false
    end
  end
end
