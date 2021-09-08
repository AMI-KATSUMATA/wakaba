class ApplyUser::RecruitmentsController < ApplicationController
  
  def index
    @recruitments = Recruitment.where(is_closed: "false", is_private: "false")
  end

  def show
    @recruitment = Recruitment.find(params[:id])
  end
end
