class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]

  def index
    @user = User.find(session[:user_id])
    questions = Question.all
    @myquestions = questions.where(user_id: session[:user_id])
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to login_path, method: :post, notice: "「#{@user.name}」を登録しました。"
    else
      render :new
    end
  end

  def update
    user = User.find(params[:id])
    user.update!(user_params)
    redirect_to user_path, notice: "質問「#{user.name}」を更新しました"
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "ユーザー「#{@user.name}」を削除しました。"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
end
