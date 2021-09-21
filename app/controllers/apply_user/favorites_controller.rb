class ApplyUser::FavoritesController < ApplicationController
  before_action :authenticate_creator!
    before_action :ensure_current_creator
    # 閲覧権限
  def ensure_current_creator
    if current_creator.id != params[:id].to_i
      flash[:alert]="閲覧権限がありません"
      redirect_to root_path
    end
  end

  def create_recruitments
    recruitment = Recruitment.find(params[:recruitment_id])
    favorite = current_creator.favorites.new(recruitment_id: recruitment.id, subject: 'recruitment')
    favorite.save
    flash[:success] = "依頼をお気に入りしました"
    redirect_to recruitment_path(recruitment)
  end

  def destroy_recruitments
    recruitment = Recruitment.find(params[:recruitment_id])
    favorite = current_creator.favorites.find_by(recruitment_id: recruitment.id, subject: 'recruitment')
    favorite.destroy
    flash[:success] = "依頼のお気に入りを取り消しました"
    redirect_to recruitment_path(recruitment)
  end

  def create_musicians
    musician = Musician.find(params[:musician_id])
    favorite = current_creator.favorites.new(musician_id: musician.id, subject: 'musician')
    favorite.save
    flash[:success] = "つのりてをお気に入りしました"
    redirect_to musician_path(musician)
  end

  def destroy_musicians
    musician = Musician.find(params[:musician_id])
    favorite = current_creator.favorites.find_by(musician_id: musician.id, subject: 'musician')
    flash[:success] = "つのりてのお気に入りを取り消しました"
    favorite.destroy
    redirect_to musician_path(musician)
  end

  def favorite_recruitments
    @creator = Creator.find(params[:id])
    favorites = Favorite.where(creator_id: @creator.id, subject: 'recruitment').pluck(:recruitment_id)
    @favorite_recruitments = Recruitment.where(id: favorites).page(params[:page]).per(7)
  end

  def favorite_musicians
    @creator = Creator.find(params[:id])
    favorites = Favorite.where(creator_id: @creator.id, subject: 'musician').pluck(:musician_id)
    @favorite_musicians = Musician.where(id: favorites).page(params[:page]).per(7)
  end



end
