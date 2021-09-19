class AnswersController < ApplicationController
  def index
  end

  def new
    @question = Question.find(params[:id])
    @answer = Answer.new
    @answered = Answer.where(question_id: @question)
  end

  def create
    # @subject = Question.find_by(params[:id])  , question_id: @question.id
    # (answer_params.merge(user_id: current_user.id))
    @answer = Answer.new(answer_params.merge(user_id: current_user.id, question_id: params[:id]))
    question = Question.find(params[:id])
    respondent = Answer.where(question_id: question.id)
    @user = respondent.where.not(user_id: current_user.id)
    if @answer.save
      @user = User.where(id: current_user.id)
      redirect_to new_answer_path, notice: "質問「#{question.title}」に回答しました。"
    else
      redirect_to new_answer_path, notice: "残念でした"
    end
  end

  def update
    answer = Answer.find(params[:id])
    answer.update!(answer_params)
    redirect_to answer_path, notice: "質問を更新しました"
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to new_answer_path, notice: "回答を削除しました。"
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :id)
  end
end
