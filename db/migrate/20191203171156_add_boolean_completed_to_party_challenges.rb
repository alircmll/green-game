class AddBooleanCompletedToPartyChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :party_challenges, :completed, :boolean, default: false
  end
end