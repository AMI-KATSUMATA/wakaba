class RecruitUser::IssuesController < ApplicationController
  before_action :authenticate_musician!

  def create
    recruitment = Recruitment.find(params[:recruitment_id])
    entries = Entry.where(recruitment_id: recruitment.id)
    begin
      # creator_idを取得する
      entries.each do |entry|
        @issue = Issue.new(recruitment_id: recruitment.id,
                           creator_id: entry.creator_id,
                           musician_id: recruitment.musician_id)
         @issue.save
         @issue.create_notification_issue!(current_musician)
      end
      recruitment.update(is_closed: true)
      entries.destroy_all
    rescue ActiveRecord::Rollback
    end
    flash[:success] = "マッチングが成立しました"
    redirect_to recruit_user_issue_path(@issue)
  end

  def show
   @issue = Issue.find(params[:id])
  end

  def update
   @issue = Issue.find(params[:id])
    if @issue.update(status: params[:issue][:status])
      flash[:success] = "進捗状況を更新しました"
      redirect_to recruit_user_issue_path(@issue)
    else
      flash.now[:alert] = "進捗状況の更新に失敗しました"
      render :show
    end
  end

  # 作成中の依頼
  def index
    @musician = Musician.find(current_musician.id)
    # 作成中のissueを取得する
    @working_issues = Issue.where(musician_id: @musician.id)
                   .where(status: "未着手")
                   .or(Issue.where(status: "作成中"))
                   .page(params[:page]).reverse_order.per(7)
    # 作成完了後のissueを取得する
    @completed_issues = Issue.where(musician_id: @musician.id)
                   .where(status: "作成完了")
                   .page(params[:page]).reverse_order.per(7)
  end

  def room
    @issue = Issue.find(params[:id])
    @message = Message.new
    @messages = Message.where(issue_id: @issue.id)
  end



end
