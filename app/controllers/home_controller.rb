class HomeController < ApplicationController

  def index
  render({ :template => "home/feed" })
  end
  
    def profile
    the_id         = params.fetch("id")
    matching_users = User.where({ :id => the_id })
    @user          = matching_users.at(0)

    render({ :template => "home/profile" })

    return
  end
end
