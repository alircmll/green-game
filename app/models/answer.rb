class Answer < ApplicationRecord
  belongs_to :party_quiz
  belongs_to :option
  belongs_to :user
end
