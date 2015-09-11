class UsersController < ApplicationController
  before_action :current_user, only: :show

  def new
  end

  def show
    @competencies = @current_user.competencies
    @rhythms = @current_user.rhythms
    @hives = @current_users.hives
  end

end
