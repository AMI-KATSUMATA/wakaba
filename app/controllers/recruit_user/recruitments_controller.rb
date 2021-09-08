class RecruitUser::RecruitmentsController < ApplicationController

  def new
    @recruitment = Recruitment.new
  end

  def create
    @recruitment = Recruitment.new(recruitment_params)
    @recruitment.musician_id = current_musician.id
    if @recruitment.save
      flash[:success] = "依頼の投稿に成功しました"
      redirect_to recruit_user_recruitment_path(@recruitment)
    else
      flash[:alert] = "依頼の投稿に失敗しました"
      render :new
    end
  end

  def index
    @recruitments = Recruitment.where(is_closed: "false", is_private: "false")
  end

  def show
    @recruitment = Recruitment.find(params[:id])
  end

  def update
    @recruitment = Recruitment.find(params[:id])
    if @recruitment.update(is_closed: params[:recruitment][:is_closed])
      flash[:success] = "依頼情報を更新しました"
      redirect_to recruit_user_recruitment_path(@recruitment)
    else
      flash[:alert] = "依頼の更新に失敗しました"
      render :edit
    end
  end

  def destroy
    @recruitment = Recruitment.find(params[:id])
    if @recruitment.destroy
      flash[:success] = "依頼を削除しました"
    else
      flash[:alert] = "依頼の削除に失敗しました"
    end
  end


  private

  def recruitment_params
    params.require(:recruitment).permit(:title, :detail, :deadline, :price, :is_closed)
  end
end
