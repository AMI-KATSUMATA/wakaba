class ApplyUser::EntriesController < ApplicationController
  before_action :authenticate_creator!

  def create
    @recruitment = Recruitment.find(params[:recruitment_id])
    entry = current_creator.entries.new(recruitment_id: @recruitment.id)
    entry.save
    entry.create_notification_entry!(current_creator)
    flash[:success] = "依頼にエントリーしました"
  end

  def destroy
    @recruitment = Recruitment.find(params[:recruitment_id])
    entry = current_creator.entries.find_by(recruitment_id: @recruitment.id)
    entry.destroy
    flash[:success] = "依頼のエントリーを取り消しました"
  end

  def entries
    @creator = Creator.find(current_creator.id)
    entries = Entry.where(creator_id: @creator.id).pluck(:recruitment_id)
    @recruitments = Recruitment.where(id: entries).page(params[:page]).per(7)
  end

end
