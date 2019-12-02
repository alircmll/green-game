class AddCategoryToTips < ActiveRecord::Migration[5.2]
  def change
    add_reference :tips, :category, foreign_key: true
  end
end
