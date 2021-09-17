class RecruitUser::HomesController < ApplicationController
  def top
    @artworks = Artwork.where(is_private: "false")
                       .order(id: "DESC").limit(5)
    @creators = Creator.where(is_deleted: "false")
                       .order(id: "DESC").limit(5)
  end
end
