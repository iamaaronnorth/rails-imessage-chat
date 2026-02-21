class MessagesController < ApplicationController
  def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.build(message_params)
    
    if @message.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @chat }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("message_form", partial: "chats/message_form", locals: { message: @message }) }
        format.html { redirect_to @chat, alert: "Message could not be sent." }
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :sender_name)
  end
end
