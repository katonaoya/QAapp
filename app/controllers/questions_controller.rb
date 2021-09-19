class QuestionsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @q = Question.ransack(params[:q])
    @questions = @q.result(distinct: true).page(params[:page])
  end

  def solved
    @user = User.find(session[:user_id])
    @q = Question.ransack(params[:q])
    questions = @q.result(distinct: true).page(params[:page])
    @questions = questions.where(solution: true)
  end

  def unsolved
    @q = Question.ransack(params[:q])
    questions = @q.result(distinct: true).page(params[:page])
    @questions = questions.where(solution: false)
  end

  def show
    # @question = Question.find(params[:id])
    # @answer = Answer.new(answer_params.merge(user_id: current_user.id))
  end

  def new
    @question = Question.new
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    question = Question.find(params[:id])
    question.update!(question_params)
    redirect_to new_answer_path(question), notice: "質問「#{question.title}」を更新しました"
  end

  def create
    @question = Question.new(question_params.merge(user_id: current_user.id))
    @user = User.where.not(id: current_user.id)
    if @question.save
      QuestionMailer.creation_email(@question, @user).deliver_now
      redirect_to root_path, notice: "質問「#{@question.title}」を投稿しました。"
    else
      render :new
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to root_path, notice: "ユーザー「#{@question.title}」を削除しました。"
  end

  private

  def question_params
    params.require(:question).permit(:title, :content, :solution)
  end

end
