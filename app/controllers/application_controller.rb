class ApplicationController < ActionController::Base
  skip_forgery_protection

    def profile
    the_id         = params.fetch("id", current_user.id)
    matching_users = User.where({ :id => the_id })
    @user          = matching_users.at(0)

    render({ :template => "users/profile" })
    return
  end
end
