class RecruitUser::CreatorsController < ApplicationController
  def index
    @creators = Creator.where(is_deleted: "false")
  end

  def show
    @creator = Creator.find(params[:id])
    # @artworks = @creator.artworks.page(params[:page]).reverse_order
  end
end
