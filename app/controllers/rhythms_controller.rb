class RhythmsController < ApplicationController
  before_action :current_user, only: [:index, :create]

  def index
    @rhythms = Rhythm.all
  end

  def create
    RhythmUser.where(user_id: @current_user.id).destroy_all
    params[:selected].each do |rhythm|
      @current_user.rhythms << Rhythm.find_by(name: rhythm)
    end
    render json: {user_id: @current_user.id}
  end

end
