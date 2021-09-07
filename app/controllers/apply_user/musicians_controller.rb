class ApplyUser::MusiciansController < ApplicationController

  def index
     @musicians = Musician.where(is_deleted: "false")
  end
  
  def show
     @musician = Musician.find(params[:id])
  end
end
