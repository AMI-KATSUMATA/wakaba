class ApplyUser::FavoritesController < ApplicationController

  def create_recruitments
    recruitment = Recruitment.find(params[:recruitment_id])
    favorite = current_creator.favorites.new(recruitment_id: recruitment.id, subject: 'recruitment')
    favorite.save
    
    redirect_to recruitment_path(recruitment)
  end

  def destroy_recruitments
    recruitment = Recruitment.find(params[:recruitment_id])
    favorite = current_creator.favorites.find_by(recruitment_id: recruitment.id, subject: 'recruitment')
    favorite.destroy
    redirect_to recruitment_path(recruitment)
  end

  def create_musicians
    musician = Musician.find(params[:musician_id])
    favorite = current_creator.favorites.new(musician_id: musician.id, subject: 'musician')
    favorite.save
    redirect_to musician_path(musician)
  end

  def destroy_musicians
    musician = Musician.find(params[:musician_id])
    favorite = current_creator.favorites.find_by(musician_id: musician.id, subject: 'musician')
    favorite.destroy
    redirect_to musician_path(musician)
  end

end
