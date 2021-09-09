class RecruitUser::IssuesController < ApplicationController
  
  def create
    recruitment = Recruitment.find(params[:recruitment_id])
    entries = Entry.where(recruitment_id: recruitment.id)
    begin
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
    redirect_to recruit_user_recruitment_issue_path(recruitment.id)
  end
  
  def show
   @issue = Issue.find(params[:id])
  end
  
  def update
   @issue = Issue.find(params[:id])
    if @recruitment.update(status: params[:issue][:status])
      flash[:success] = "進捗状況を更新しました"
      redirect_to recruit_user_recruitment_issue_path(@issue)
    else
      flash[:alert] = "進捗状況の更新に失敗しました"
      render :show
    end
  end
  
end
