class ChatsController < ApplicationController

  def index
    @chats = Chat.all
  end

  def create
    chat = Chat.new(body: params[:body])
    if chat.save
      chat.generate_answer
      redirect_to chats_path
    else
      redirect_to chats_path, alert: "メッセージを入力してください"
    end
  end
end
