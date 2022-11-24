class Admin::HomesController < ApplicationController

  def top
    @users = User.first(10)
    @posts = Post.first(10)
    @species = Species.first(10)
    @areas = Area.first(10)
    @fishing_method = FishingMethod.first(10)
  end

end
