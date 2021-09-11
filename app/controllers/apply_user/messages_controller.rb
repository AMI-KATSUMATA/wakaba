class ApplyUser::MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    if message.save
      redirect_to room_issue_path(message.issue_id)
    else
      flash[:alert] = "メッセージの送信に失敗しました"
      render 'apply_user/issues/room'
    end
  end


  private

  def message_params
    params.require(:message).permit(:content, :issue_id).merge(creator_id: current_creator.id)
  end

end
