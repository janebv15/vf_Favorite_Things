class HomeController < ApplicationController
  def index
    recommendations = Recommendation.all.order({ :created_at => :desc })

    # filter by username
    username_search = params.fetch("username_search", "")
    if username_search != ""
      matching_users = User.where(
        ["username LIKE ?", "%" + username_search + "%"]
      )
      user_ids = matching_users.pluck(:id)
      recs = recs.where({ :user_id => user_ids })
    end

    # filter by category
    if params.fetch("category_id", "") != ""
      recs = recs.where({ :category_id => params.fetch("category_id") })
    end

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
 #   @user = User.where({ "id" => params.fetch("user_id") }).at(0)
  #  @category = Category.where({ "id" => params.fetch("category_id") }).at(0)

   # @recommendations = Recommendation.
    #  where({ :user_id     => @user.id,
     #         :category_id => @category.id }).
      #order({ :created_at  => :desc })

  render({ :template => "home/profile" })
end

end
