class RecruitUser::RecruitmentPostscriptsController < ApplicationController
  before_action :authenticate_musician!

  def create
    @recruitment = Recruitment.find(params[:recruitment_id])
    @postscript = current_musician.recruitment_postscripts.new(recruitment_postscript_params)
    @postscript.recruitment_id = @recruitment.id
    if @postscript.save
      flash.now[:success] = "追記を登録しました"
      render :index
    else
      flash[:alert] = "追記の登録に失敗しました"
      @recruitment = Recruitment.find(params[:id])
      @postscript = RecruitmentPostscript.new
      entries = Entry.where(recruitment_id: @recruitment.id).pluck(:creator_id)
      @entry_creators = Creator.find(entries)
      render 'recruit_user/recruitments/show'
    end
  end

  def destroy
    RecruitmentPostscript.find_by(id: params[:id], recruitment_id: params[:recruitment_id]).destroy
    @recruitment = Recruitment.find(params[:recruitment_id])
    flash[:success] = "追記を削除しました"
    render :index
  end

  private

  def recruitment_postscript_params
    params.require(:recruitment_postscript).permit(:postscript)
  end

end
