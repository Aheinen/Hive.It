class CompetenciesController < ApplicationController
  before_action :current_user, only: [:index, :new, :create, :update]

  def index
    @competencies = Competency.all
  end

  def new
    @competencies = Competency.where(id: CompetencyUser.where(user_id: @current_user.id))
  end

  def create
    params[:selected].each do |competency|
      CompetencyUser.create(user_id: @current_user.id, competency_id: Competency.find_by(name: competency).id)
    end
    render json: {user_id: @current_user.id}
  end

  def update

  end

end

