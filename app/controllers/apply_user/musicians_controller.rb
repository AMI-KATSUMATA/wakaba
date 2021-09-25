class ApplyUser::MusiciansController < ApplicationController
  before_action :authenticate_creator!

  def index
     @musicians = Musician.where(is_deleted: "false").page(params[:page]).reverse_order.per(7)
  end

  def show
     @musician = Musician.find(params[:id])
     @recruitments = Recruitment.where(musician_id: @musician.id, is_private: "false")
                                .page(params[:page]).reverse_order.per(8)
  end
  

end
