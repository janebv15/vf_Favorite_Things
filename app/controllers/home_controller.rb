class HomeController < ApplicationController
  def index
    recommendations = Recommendation.all.order({ :created_at => :desc })

def self.ransackable_attributes(auth_object = nil)
    # Let's allow filtering by the title and year columns; but no others
    ["title", "year"]
  end
    
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
@feed_items = recommendations.map do |recommendation|
       {
         :user_id        => recommendation.user.id,
         :username       => recommendation.user.username,
         :category_name  => recommendation.category.name,
         :favorite_thing => recommendation.name,
         :description    => recommendation.description,
       }
      end
      
    render({ :template => "home/feed" })
  end

  def profile
     @user                 = User.where({ :id => params.fetch("user_id") }).at(0)
     @categories           = Category.all
     @user_recommendations = Recommendation.where({ :user_id => @user.id })
     render({ :template => "home/profile" })
   end

def filter
    render({ :template => "home/filter" })
end

end
