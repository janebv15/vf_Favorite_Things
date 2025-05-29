class ApplicationController < ActionController::Base
  skip_forgery_protection

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def profile
    the_id = params.fetch("id", current_user.id)
    matching_users = User.where({ :id => the_id })
    @user = matching_users.at(0)

    render({ :template => "users/profile" })
    return
  end
end
