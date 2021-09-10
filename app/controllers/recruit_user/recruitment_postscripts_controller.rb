class RecruitUser::RecruitmentPostscriptsController < ApplicationController

  def create
    recruitment = Recruitment.find(params[:recruitment_id])
    postscript = current_musician.recruitment_postscripts.new(recruitment_postscript_params)
    postscript.recruitment_id = recruitment.id
    postscript.save
    redirect_to recruit_user_recruitment_path(recruitment)
  end

  def destroy
    RecruitmentPostscript.find_by(id: params[:id], recruitment_id: params[:recruitment_id]).destroy
    redirect_to recruit_user_recruitment_path(params[:recruitment_id])
  end

  private

  def recruitment_postscript_params
    params.require(:recruitment_postscript).permit(:postscript)
  end

end
