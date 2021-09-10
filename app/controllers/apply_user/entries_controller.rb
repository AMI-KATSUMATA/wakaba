class ApplyUser::EntriesController < ApplicationController
  
  def create
    recruitment = Recruitment.find(params[:recruitment_id])
    entry = current_creator.entries.new(recruitment_id: recruitment.id)
    entry.save
    redirect_to recruitment_path(recruitment)
  end
  
  def destroy
    recruitment = Recruitment.find(params[:recruitment_id])
    entry = current_creator.entries.find_by(recruitment_id: recruitment.id)
    entry.destroy
    redirect_to recruitment_path(recruitment)  
  end
  
  def entries
    @creator = Creator.find(params[:id])
    entries = Entry.where(creator_id: @creator.id).pluck(:recruitment_id)
    @entry_recruitments = Recruitment.find(entries)
  end
  
end
