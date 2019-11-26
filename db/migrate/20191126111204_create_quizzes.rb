class CreateQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :quizzes do |t|
      t.integer :points_by_question

      t.timestamps
    end
  end
end
