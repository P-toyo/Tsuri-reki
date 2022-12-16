class Public::InformationController < ApplicationController

  def index
    @information = Information.all.page(params[:page]).per(20)
  end

  def show
    @information = Information.find(params[:id])
  end

end
