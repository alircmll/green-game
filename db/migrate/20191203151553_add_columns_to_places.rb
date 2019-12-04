class AddColumnsToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :status, :string
    add_column :places, :accept, :text
  end
end
