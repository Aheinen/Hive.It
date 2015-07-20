class QuestionsController < ApplicationController
  def new
    @user = User.find_by(id: params[:user_id])
    @top_questions = Question.all.sample(3)
  end
end
