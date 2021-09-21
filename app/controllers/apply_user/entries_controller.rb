class ApplyUser::EntriesController < ApplicationController
  before_action :authenticate_creator!
    before_action :ensure_current_creator
    # 閲覧権限
  def ensure_current_creator
    if current_creator.id != params[:id].to_i
      flash[:alert]="閲覧権限がありません"
      redirect_to root_path
    end
  end

  def create
    recruitment = Recruitment.find(params[:recruitment_id])
    entry = current_creator.entries.new(recruitment_id: recruitment.id)
    entry.save
    entry.create_notification_entry!(current_creator)
    flash[:success] = "依頼にエントリーしました"
    redirect_to recruitment_path(recruitment)
  end

  def destroy
    recruitment = Recruitment.find(params[:recruitment_id])
    entry = current_creator.entries.find_by(recruitment_id: recruitment.id)
    entry.destroy
    flash[:success] = "依頼のエントリーを取り消しました"
    redirect_to recruitment_path(recruitment)
  end

  def entries
    @creator = Creator.find(params[:id])
    entries = Entry.where(creator_id: @creator.id).pluck(:recruitment_id)
    @entry_recruitments = Recruitment.where(id: entries).page(params[:page]).per(7)
  end

end
