class ApplyUser::ArtworksController < ApplicationController

  def new
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.new(artwork_params)
    @artwork.creator_id = current_creator.id
    if @artwork.save
      flash[:success] = "ポートフォリオの投稿に成功しました"
      redirect_to artwork_path(@artwork)
    else
      flash[:alert] = "依頼の投稿に失敗しました"
      render :new
    end
  end

  def show
    @artwork = Artwork.find(params[:id])
  end

  def edit
    @artwork = Artwork.find(params[:id])
  end

  def update
    @artwork = Artwork.find(params[:id])
    if @artwork.update(artwork_params)
      flash[:success] = "依頼情報を更新しました"
      redirect_to artwork_path(@artwork)
    else
      flash[:alert] = "依頼の更新に失敗しました"
      render :edit
    end
  end

  def private
    @artwork = Artwork.find(params[:id])
    @artwork.update(is_private: true)
    flash[:success] = "依頼を削除しました"
    redirect_to creator_path(current_creator)
  end

  private

  def artwork_params
    params.require(:artwork).permit(:description, :is_private, :artwork_image)
  end
end
