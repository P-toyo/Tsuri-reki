class Public::UsersController < ApplicationController

  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def edit
    if current_user.id != params[:id].to_i
      redirect_to request.referer
    end
    @user = User.find(params[:id])
    @record = Record.new
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    redirect_to request.referer
  end

  private

  def user_params
    params.require(:user).permit(:email, :prefecture_id, :name, :is_deleted, :image)
  end

end