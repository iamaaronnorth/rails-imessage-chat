class ReactionsController < ApplicationController
  def create
    @message = Message.find(params[:message_id])
    @reaction = @message.reactions.build(reaction_params)
    
    if @reaction.save
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("message_#{@message.id}_reactions", partial: "messages/reactions", locals: { message: @message }) }
        format.html { redirect_to @message.chat }
      end
    else
      head :unprocessable_entity
    end
  end

  def destroy
    @reaction = Reaction.find(params[:id])
    @message = @reaction.message
    @reaction.destroy
    
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace("message_#{@message.id}_reactions", partial: "messages/reactions", locals: { message: @message }) }
      format.html { redirect_to @message.chat }
    end
  end

  private

  def reaction_params
    params.require(:reaction).permit(:emoji, :sender_name)
  end
end
