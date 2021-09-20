class RecruitUser::CreatorsController < ApplicationController
  def index
    @creators = Creator.where(is_deleted: "false").page(params[:page]).reverse_order.per(7)
  end

  def show
    @creator = Creator.find(params[:id])
    @artworks = Artwork.where(creator_id: @creator.id, is_private: "false")
                      .page(params[:page]).reverse_order.per(12)
  end
end
