class RecruitUser::MusiciansController < ApplicationController
  before_action :authenticate_musician! 
  before_action :ensure_current_musician
  # 閲覧権限
  def ensure_current_musician
    if current_musician.id != params[:id].to_i
      flash[:alert]="閲覧権限がありません"
      redirect_to recruit_user_path
    end
  end

  def show
     @musician = Musician.find(params[:id])
     @recruitments = Recruitment.where(musician_id: @musician.id, is_private: "false")
                                .page(params[:page]).reverse_order.per(7)
  end

  def edit
    @musician = Musician.find(params[:id])
  end

  def update
    @musician = Musician.find(params[:id])
    if @musician.update(musician_params)
      flash[:notice] = "登録情報を更新しました"
      redirect_to recruit_user_musician_path(@musician.id)
    else
      flash.now[:alert] = "登録情報の更新に失敗しました"
      render :edit
    end
  end

  def unsubscribe
    @musician = Musician.find(params[:id])
  end

  def withdraw
    @musician = Musician.find(params[:id])
    @musician.update(is_deleted: true)
    reset_session
    flash[:alert] = "退会しました"
    redirect_to root_path
  end

    private

    def musician_params
      params.require(:musician).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :email, :phone_number, :introduction, :is_deleted, :profile_image)
    end

end
