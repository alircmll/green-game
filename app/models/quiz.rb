class Quiz < ApplicationRecord
  has_many :questions
  has_many :party_quizzes
end
