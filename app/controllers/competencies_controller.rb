class CompetenciesController < ApplicationController
  before_action :current_user, only: [:index, :rank, :create, :update]

  def index
    @competencies = Competency.all
  end

  def rank
    @competencies = Competency.where(id: CompetencyUser.where(user_id: @current_user.id).pluck(:competency_id))
  end

  def create
    CompetencyUser.where(user_id: @current_user.id).destroy_all
    params[:selected].each do |competency|
      CompetencyUser.create(user_id: @current_user.id, competency_id: Competency.find_by(name: competency).id)
    end
    render json: {user_id: @current_user.id}
  end

  def update
    params[:selected].each_with_index do |competency, index|
      CompetencyUser.where(user_id: @current_user.id, competency_id: Competency.find_by(name: competency).id)[0].update(rank: index + 1)
    end
    render json: {user_id: @current_user.id}
  end

end

