class HomeController < ApplicationController
  def index
    recommendations = Recommendation.all.order({ :created_at => :desc })

    @feed_items = recommendations.map do |recommendation|
      {
        :username => recommendation.user.username,
        :category_name => recommendation.category.name,
        :favorite_thing => recommendation.name,
        :description => recommendation.description,
      }
    end

    render({ :template => "home/feed" })
  end

  def profile
    the_id = params.fetch("id")
    matching_users = User.where({ :id => the_id })
    @user = matching_users.at(0)

    render({ :template => "home/profile" })

    return
  end
end
