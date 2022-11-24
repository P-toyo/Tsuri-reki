class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @record = Record.new
  end

end
