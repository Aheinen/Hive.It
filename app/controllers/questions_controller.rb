class QuestionsController < ApplicationController
  before_action :current_user, only: [:new, :create]

  def new
    @questions = Question.all.sample(3)
  end

  def create
    question = Question.new(user_id: @current_user.id, inquiry: params[:question])
    if question.save
      hive = Hive.create(question_id: question.id, solo: params[:solo])
      HiveUser.create(hive_id: hive.id, user_id: @current_user.id)
      render json: {user_id: @current_user.id}
    end
  end

end
