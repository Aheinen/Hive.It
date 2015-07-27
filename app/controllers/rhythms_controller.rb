class RhythmsController < ApplicationController
  before_action :current_user, only: [:index, :create]

  def index
    @rhythms = Rhythm.all
  end

  def create
    RhythmUser.where(user_id: @current_user.id).destroy_all
    params[:selected].each do |rhythm|
      RhythmUser.create(user_id: @current_user.id, rhythm_id: Rhythm.find_by(name: rhythm).id)
    end
    render json: {user_id: @current_user.id}
  end

end
