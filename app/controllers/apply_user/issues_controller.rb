class ApplyUser::IssuesController < ApplicationController
  before_action :authenticate_creator!
  before_action :ensure_current_creator
  # 閲覧権限
  def ensure_current_creator
     issue =Issue.find(params[:id])
    if current_creator.id != issue.creator_id
      flash[:alert]="閲覧権限がありません"
      redirect_to root_path
    end
  end

  def show
   @issue = Issue.find(params[:id])
  end

  def working_issues
    @creator = Creator.find(current_creator.id)
    # 作成中のissueを取得する
    @issues = Issue.where(creator_id: @creator.id)
                   .where(status: "未着手")
                   .or(Issue.where(status: "作成中"))
                   .page(params[:page]).reverse_order.per(7)
  end

  def completed_issues
    @creator = Creator.find(current_creator.id)
    # 作成完了後のissueを取得する
    @issues = Issue.where(creator_id: @creator.id)
                   .where(status: "作成完了")
                   .page(params[:page]).reverse_order.per(7)
  end

  def room
    @issue = Issue.find(params[:id])
    @message = Message.new
    @messages = Message.where(issue_id: @issue.id)
  end

end
