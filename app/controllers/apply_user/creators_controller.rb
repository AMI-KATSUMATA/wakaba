class ApplyUser::CreatorsController < ApplicationController

  def index
    @creators = Creator.where(is_deleted: "false")
  end

  def show
    @creator = Creator.find(params[:id])
    # @artworks = @creator.artworks.page(params[:page]).reverse_order
  end

  def edit
    @creator = Creator.find(params[:id])
  end

  def update
    @creator = Creator.find(params[:id])
    if @creator.update(creator_params)
      flash[:notice] = "登録情報を更新しました"
    redirect_to creator_path(@creator.id)
    else
      flash[:alert] = "登録情報の更新に失敗しました"
      render :edit
    end
  end

  def unsubscribe
     @creator = Creator.find(params[:id])
  end

  def withdraw
    @creator = Creator.find(params[:id])
    @creator.update(is_deleted: true)
    reset_session
    flash[:alert] = "退会しました"
    redirect_to root_path
  end



  private

    def creator_params
      params.require(:creator).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :email, :phone_number, :schedule, :price, :intriduction, :is_deleted, :profile_image)
    end

end