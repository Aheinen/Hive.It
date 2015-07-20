class CompetenciesController < ApplicationController

  def index
    @competencies = Competency.all
  end

  def new
    @user = User.find_by(id: params[:user_id])
    @competencies = Competency.where(id: CompetencyUser.where(user_id: @user.id))
  end

end
