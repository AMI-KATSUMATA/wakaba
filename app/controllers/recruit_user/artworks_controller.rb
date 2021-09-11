class RecruitUser::ArtworksController < ApplicationController
  
  def index
    @artworks = Artwork.where(is_private: "false")
  end

  def show
    @artwork = Artwork.find(params[:id])
  end
end
