class CreatePartyQuizzes < ActiveRecord::Migration[5.2]
  def change
    create_table :party_quizzes do |t|      
      t.integer :party_points, default: 0
      t.integer :position_in_quiz, default: 0
      t.boolean :done, default: false
      t.references :quiz, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
