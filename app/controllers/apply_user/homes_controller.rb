class ApplyUser::HomesController < ApplicationController
  def top
     @recruitments = Recruitment.where(is_closed: "false", is_private: "false")
                                .includes(:favorited_creators).limit(5).sort {|a,b| b.favorited_creators.size <=> a.favorited_creators.size}
     @musicians = Musician.where(is_deleted: "false")
                                .includes(:favorited_creators).limit(5).sort {|a,b| b.favorited_creators.size <=> a.favorited_creators.size}
     @artworks = Artwork.where(is_private: "false")
                       .order(id: "DESC").limit(5)                                
  end
end
