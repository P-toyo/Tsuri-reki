class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :sidebar_instance

protected

  def sidebar_instance
    @sidebar_posts = Post.order(created_at: :desc).limit(10)
  end

  def configure_permitted_parameters
    #deviseのストロングパラメータ
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :prefecture_id, :image, :remember_me])
    devise_parameter_sanitizer.permit(:sign_in, keys:[:remember_me])
  end

end
