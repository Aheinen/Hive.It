class QuestionsController < ApplicationController
  before_action :current_user, only: [:new, :create]

  def new
    @hives = Hive.where(solo: false).sample(3)
  end

  def create
    question = Question.new(user_id: @current_user.id, inquiry: params[:question])
    if question.save
      hive = Hive.create(question_id: question.id, solo: params[:solo])
      HiveUser.create(hive_id: hive.id, user_id: @current_user.id)

      ## For testing purposes, we will allow Julian and Alex to become the admin users for every hive
      if @current_user.id != 1 && @current_user.id != 2
        HiveUser.create(hive_id: hive.id, user_id: 1)
        HiveUser.create(hive_id: hive.id, user_id: 2)
      end

      render json: {user_id: @current_user.id}
    end
  end

end
