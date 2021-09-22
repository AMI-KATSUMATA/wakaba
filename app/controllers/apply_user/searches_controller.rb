class ApplyUser::SearchesController < ApplicationController
  
  def search
    @range = params[:range]
    if @range == "つのりて"
      @musicians = Musician.looks(params[:word]).page(params[:page]).per(7)
    else
      @recruitments = Recruitment.looks(params[:word]).page(params[:page]).per(7)
    end
  end
  
end
