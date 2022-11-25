class Public::AreaRatingsController < ApplicationController
  def create
    @area_rating = AreaRating.new(area_rating_params)
    @area_rating.user_id = current_user.id
    @area_rating.save
    redirect_to request.referer
  end

  private
  def area_rating_params
    params.require(:area_rating).permit(:area_id, :comment, :score)
  end

end
