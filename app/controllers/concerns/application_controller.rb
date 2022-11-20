class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

protected

  def configure_permitted_parameters
    #deviseのストロングパラメータ
    devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :prefecture_id, :image, :remember_me])
    devise_parameter_sanitizer.permit(:sign_in, keys:[:remember_me])
  end

end
