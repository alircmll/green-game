class AddPositionToPartyChallenges < ActiveRecord::Migration[5.2]
  def change
    add_column :party_challenges, :position, :integer, :default => 0
    #Ex:- :default =>''
  end
end
