class RecruitUser::ArtworksController < ApplicationController
  before_action :authenticate_musician!
  
  def index
    @artworks = Artwork.where(is_private: "false").page(params[:page]).reverse_order.per(12)
  end

  def show
    @artwork = Artwork.find(params[:id])
  end
end
