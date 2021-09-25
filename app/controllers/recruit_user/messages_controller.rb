class RecruitUser::MessagesController < ApplicationController
 before_action :authenticate_musician!

  def create
    @message = Message.new(message_params)
    if @message.save
       @message.create_notification_musician_message!(current_musician)
    else
      @issue = Issue.find(params[:id])
      @message = Message.new
      @messages = Message.where(issue_id: @issue.id)
      flash.now[:alert] = "メッセージの送信に失敗しました"
      render 'recruit_user/issues/room'
    end
  end


  private

  def message_params
    params.require(:message).permit(:content, :issue_id).merge(musician_id: current_musician.id)
  end

end
