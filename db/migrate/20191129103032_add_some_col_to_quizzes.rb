class AddSomeColToQuizzes < ActiveRecord::Migration[5.2]
  def change
    add_reference :quizzes, :category, foreign_key: true
    add_column :quizzes, :title, :string
    add_column :quizzes, :description, :string
  end
end
