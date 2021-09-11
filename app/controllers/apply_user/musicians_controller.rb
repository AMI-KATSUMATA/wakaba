class ApplyUser::MusiciansController < ApplicationController

  def index
     @musicians = Musician.where(is_deleted: "false")
  end
  
  def show
     @musician = Musician.find(params[:id])
     @recruitments = Recruitment.where(musician_id: @musician.id, is_private: "false")
                                .page(params[:page]).reverse_order
  end
end
