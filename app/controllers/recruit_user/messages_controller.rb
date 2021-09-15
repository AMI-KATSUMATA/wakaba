class RecruitUser::MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    if message.save
       message.create_notification_musician_message!(current_musician)
       redirect_to room_recruit_user_issue_path(message.issue_id)
    else
      @issue = Issue.find(params[:id])
      @message = Message.new
      @messages = Message.where(issue_id: @issue.id)
      flash[:alert] = "メッセージの送信に失敗しました"
      render 'recruit_user/issues/room'
    end
  end


  private

  def message_params
    params.require(:message).permit(:content, :issue_id).merge(musician_id: current_musician.id)
  end

end
