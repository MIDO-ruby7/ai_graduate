class AddQueryToChats < ActiveRecord::Migration[7.0]
  def change
    add_column :chats, :answer, :text
  end
end
