class ApplyUser::MessagesController < ApplicationController
  before_action :authenticate_creator!
  def create
    @message = Message.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to "issue_path(params[:issue_id])" }
        format.json
      end
      @message.create_notification_creator_message!(current_creator)
    else
      @issue = Issue.find(params[:id])
      @message = Message.new
      @messages = Message.where(issue_id: @issue.id)
      flash.now[:alert] = "メッセージの送信に失敗しました"
      render 'apply_user/issues/room'
    end
  end


  private

  def message_params
    params.require(:message).permit(:content, :issue_id, :image).merge(creator_id: current_creator.id)
  end

end
