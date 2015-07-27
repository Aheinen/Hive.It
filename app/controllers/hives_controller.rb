class HivesController < ApplicationController
  before_action :current_user, only: [:index, :show]

  def index
    @active_hives = Hive.where(id: HiveUser.where(user_id: @current_user.id).pluck(:hive_id)).where(active: true)
    @pending_hives = Hive.where(id: HiveUser.where(user_id: @current_user.id).pluck(:hive_id)).where(active: false)
    @potential_hives = Hive.all.sample(3)
  end

  def show
    @current_hive = Hive.find_by(id: params[:id])
    @hive_users = HiveUser.where(hive_id: @current_hive.id)
  end

end
