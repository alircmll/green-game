class CreatePartyChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :party_challenges do |t|
      t.integer :point
      t.references :user, foreign_key: true
      t.references :challenge, foreign_key: true

      t.timestamps
    end
  end
end
