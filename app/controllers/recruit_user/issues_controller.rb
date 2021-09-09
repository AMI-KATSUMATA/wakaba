class RecruitUser::IssuesController < ApplicationController
  
  def create
    recruitment = Recruitment.find(params[:recruitment_id])
    entries = Entry.where(recruitment_id: recruitment.id).pluck(:creator_id)
    issue = current_creator.entries.new(recruitment_id: recruitment.id, creator_id: )
    recruitment.update(is_closed: true)
    entries = Entry.where(recruitment_id: recruitment.id)
    entries.destroy_all
    issue.save
    redirect_to recruit_user_issues_path()
  end
end
