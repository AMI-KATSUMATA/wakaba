class ApplyUser::FavoritesController < ApplicationController
  before_action :authenticate_creator!
  
  def create_recruitments
    @recruitment = Recruitment.find(params[:recruitment_id])
    favorite = current_creator.favorites.new(recruitment_id: @recruitment.id, subject: 'recruitment')
    favorite.save
    flash.now[:success] = "依頼をお気に入りしました"
  end

  def destroy_recruitments
    @recruitment = Recruitment.find(params[:recruitment_id])
    favorite = current_creator.favorites.find_by(recruitment_id: @recruitment.id, subject: 'recruitment')
    favorite.destroy
    flash.now[:success] = "依頼のお気に入りを取り消しました"
  end

  def create_musicians
    @musician = Musician.find(params[:musician_id])
    favorite = current_creator.favorites.new(musician_id: @musician.id, subject: 'musician')
    favorite.save
    flash.now[:success] = "つのりてをお気に入りしました"
  end

  def destroy_musicians
    @musician = Musician.find(params[:musician_id])
    favorite = current_creator.favorites.find_by(musician_id: @musician.id, subject: 'musician')
    favorite.destroy
    flash.now[:success] = "つのりてのお気に入りを取り消しました"
  end

  def favorite_recruitments
    @creator = Creator.find(current_creator.id)
    favorites = Favorite.where(creator_id: @creator.id, subject: 'recruitment').pluck(:recruitment_id)
    @recruitments = Recruitment.where(id: favorites).page(params[:page]).per(7)
  end

  def favorite_musicians
    @creator = Creator.find(current_creator.id)
    favorites = Favorite.where(creator_id: @creator.id, subject: 'musician').pluck(:musician_id)
    @musicians = Musician.where(id: favorites).page(params[:page]).per(7)
  end


end
