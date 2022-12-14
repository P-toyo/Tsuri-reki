class Admin::HomesController < ApplicationController

  before_action :authenticate_admin!
  require 'groupdate'

  def top
    @users = User.first(10)
    @posts = Post.where("created_at > ?", 6.months.ago)
    @species = Species.first(10)
    @areas = Area.first(10)
    @fishing_method = FishingMethod.first(10)
  end

end
