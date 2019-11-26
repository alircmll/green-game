class PartyChallenge < ApplicationRecord
  belongs_to :user
  belongs_to :challenge
end
