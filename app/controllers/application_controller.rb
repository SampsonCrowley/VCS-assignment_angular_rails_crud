class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_devise_params, if: :devise_controller?
  before_action :authenticate_user!, unless: :devise_controller?

  private
    def configure_devise_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    end
end
