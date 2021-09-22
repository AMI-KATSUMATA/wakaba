class RecruitUser::HomesController < ApplicationController
  before_action :authenticate_musician!
  def top
    @artworks = Artwork.where(is_private: "false")
                       .order(id: "DESC").limit(5)
    @creators = Creator.where(is_deleted: "false")
                       .order(id: "DESC").limit(5)
  end
end
