class ApplyUser::IssuesController < ApplicationController
  before_action :authenticate_creator!

  def show
   @issue = Issue.find(params[:id])
  end

  def index
    @creator = Creator.find(current_creator.id)
    # 作成中のissueを取得する
    @working_issues = Issue.where(creator_id: @creator.id)
                   .where(status: "未着手")
                   .or(Issue.where(status: "作成中"))
                   .page(params[:page]).reverse_order.per(7)
  
    # 作成完了後のissueを取得する
    @completedissues = Issue.where(creator_id: @creator.id)
                   .where(status: "作成完了")
                   .page(params[:page]).reverse_order.per(7)
  end

  def room
    @issue = Issue.find(params[:id])
    @message = Message.new
    @messages = Message.where(issue_id: @issue.id)
  end
  
end
