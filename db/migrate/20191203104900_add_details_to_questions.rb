class AddDetailsToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :details, :string
    add_column :questions, :link, :string
  end
end
