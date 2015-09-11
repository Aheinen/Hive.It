class CompetenciesController < ApplicationController
  before_action :current_user, only: [:index, :rank, :create, :update]

  def index
    @competencies = Competency.all
  end

  def rank
    @competencies = @current_user.competencies
  end

  def create
    CompetencyUser.where(user_id: @current_user.id).destroy_all
    params[:selected].each do |competency|
      @current_user.competencies << Competency.find_by(name: competency)
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

