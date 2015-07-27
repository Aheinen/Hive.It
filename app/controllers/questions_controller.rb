class QuestionsController < ApplicationController
  before_action :current_user, only: [:new, :create]

  def new
    @top_questions = Question.all.sample(3)
  end

  def create
    Question.create(user_id: @current_user.id, inquiry: params[:question])
  end

end
