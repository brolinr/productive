# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password password_confimation])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name email password password_confimation])
  end
end
