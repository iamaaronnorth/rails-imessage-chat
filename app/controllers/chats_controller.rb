class ChatsController < ApplicationController
  def index
    @chats = Chat.all
    @current_chat = @chats.first
  end

  def show
    @chat = Chat.find(params[:id])
    @chats = Chat.all
    @messages = @chat.messages.order(:created_at)
    @message = Message.new
  end
end
