class RecruitUser::IssuesController < ApplicationController

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
      flash[:alert] = "進捗状況の更新に失敗しました"
      render :show
    end
  end

  def working_issues
    @musician = Musician.find(current_musician.id)
    # 作成中のissueを取得する
    @issues = Issue.where(musician_id: @musician.id)
                   .where(status: "未着手")
                   .or(Issue.where(status: "作成中"))
  end
  
  def completed_issues
    @musician = Musician.find(current_musician.id)
    # 作成完了後のissueを取得する
    @issues = Issue.where(musician_id: @musician.id)
                   .where(status: "作成完了")
  end

end
