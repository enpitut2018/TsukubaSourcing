class ChangeChatUser < ActiveRecord::Migration[5.2]
  def change
    rename_column :chats, :user_id, :from_id
    add_column :chats, :to_id, :integer
  end
end
