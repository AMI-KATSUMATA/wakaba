class RecruitUser::SearchesController < ApplicationController
  
    def search
      @creators = Creator.looks(params[:word]).page(params[:page]).per(7)
    end
    
end
