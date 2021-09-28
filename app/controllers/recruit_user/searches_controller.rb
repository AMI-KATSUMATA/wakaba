class RecruitUser::SearchesController < ApplicationController
 before_action :authenticate_musician!

    def search
      @creators = Creator.looks(params[:word]).page(params[:page]).per(7)
    end

end
