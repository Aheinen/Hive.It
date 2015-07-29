class UsersController < ApplicationController
  before_action :current_user, only: :show

  def new
  end

  def show
    @competencies = Competency.where(id: CompetencyUser.where(user_id: @current_user.id).pluck(:competency_id))
    @rhythms = Rhythm.where(id: RhythmUser.where(user_id: @current_user.id).pluck(:rhythm_id))
    @hives = Hive.where(id: HiveUser.where(user_id: @current_user.id).pluck(:hive_id))
  end

end
