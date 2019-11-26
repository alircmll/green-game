class CreateChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :challenges do |t|
      t.integer :duration
      t.integer :step_number
      t.integer :points_by_step
      t.string :title
      t.text :description
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
