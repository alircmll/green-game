class AddPhotoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :photo, :string, default: "https://www.trzcacak.rs/myfile/detail/385-3856300_no-avatar-png.png"
  end
end
