class AddPartyQuizzesToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_reference :answers, :party_quiz, foreign_key: true
  end
end
