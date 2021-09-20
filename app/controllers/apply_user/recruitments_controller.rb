class ApplyUser::RecruitmentsController < ApplicationController
  
  def index
    @recruitments = Recruitment.where(is_closed: "false", is_private: "false").page(params[:page]).reverse_order.per(7)
  end

  def show
    @recruitment = Recruitment.find(params[:id])
  end
end
