class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :banned?
  before_filter :update_sanitized_params, if: :devise_controller?
  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:username, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.for(:account_update) << :username
  end

  def current_ability
    @current_ability ||= Ability.new(current_user)
  end

  def banned?
    if current_user.present? && current_user.isbanned?
      sign_out current_user
      flash[:error] = "This account has been suspended."
      root_path
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end

end
