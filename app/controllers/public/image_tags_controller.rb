class Public::ImageTagsController < ApplicationController

  def destroy
    image_tag = ImageTag.find(params[:id])
    image_tag.destroy
    redirect_to request.referer
  end

end