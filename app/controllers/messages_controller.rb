class MessagesController < ApplicationController
  def create
    @message = current_user.messages.build(message_params)
    @message.save
    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def message_params
    params.expect(message: [ :body ])
  end
end
