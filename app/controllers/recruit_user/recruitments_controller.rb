class RecruitUser::RecruitmentsController < ApplicationController
 before_action :authenticate_musician!
  before_action :ensure_current_musician, {except: [:new, :create]}
  # 閲覧権限
  def ensure_current_musician
    recruitment = Recruitment.find(params[:id])
    if current_musician.id != recruitment.musician_id
      flash[:alert]="閲覧権限がありません"
      redirect_to recruit_user_path
    end
  end

  def new
    @recruitment = Recruitment.new
  end

  def create
    @recruitment = Recruitment.new(recruitment_params)
    @recruitment.musician_id = current_musician.id
    if @recruitment.save
      flash[:success] = "依頼の投稿に成功しました"
      redirect_to recruit_user_recruitment_path(@recruitment)
    else
      flash.now[:alert] = "依頼の投稿に失敗しました"
      render :new
    end
  end

  def show
    @recruitment = Recruitment.find(params[:id])
    @postscript = RecruitmentPostscript.new
    entries = Entry.where(recruitment_id: @recruitment.id).pluck(:creator_id)
    @entry_creators = Creator.find(entries)
  end

  def update
    @recruitment = Recruitment.find(params[:id])
    if @recruitment.update(is_closed: params[:recruitment][:is_closed])
      flash[:success] = "依頼情報を更新しました"
      redirect_to recruit_user_recruitment_path(@recruitment)
    else
      flash.now[:alert] = "依頼の更新に失敗しました"
      render :edit
    end
  end

  def private
    @recruitment = Recruitment.find(params[:id])
    @recruitment.update(is_private: true)
    flash[:success] = "依頼を削除しました"
    redirect_to recruit_user_musician_path(current_musician)
  end

  private

  def recruitment_params
    params.require(:recruitment).permit(:title, :detail, :deadline, :price, :is_closed, :is_private)
  end

  
end
