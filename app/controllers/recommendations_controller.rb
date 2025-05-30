class RecommendationsController < ApplicationController
  before_action :load_categories, { :only => [:index, :create] }

  def index
    @list_of_recommendations = Recommendation.all
    render({ :template => "recommendations/index" })
  end

  def new
    @recommendation = Recommendation.new
    render({ :template => "recommendations/index" })
  end

  def create
    the_name = params.fetch("query_name")
    the_description = params.fetch("query_description")
    the_category_id = params.fetch("category_id")

    # matching_category = Category.where({ :id => the_category_id }).at(0)
    #existing_count    = Recommendation.where({ :category_id => the_category_id }).count

    # if existing_count >= matching_category.max_items
    #redirect_to("/recommendations")
    #return

    rec = Recommendation.new
    rec.name = the_name
    rec.description = the_description
    rec.category_id = the_category_id
    rec.user_id = current_user.id

    # ← here is Step 3
    if rec.save
      Rails.logger.debug("✔ recommendation saved! id=#{rec.id}")
    else
      Rails.logger.debug("✗ failed to save: #{rec.errors.full_messages.inspect}")
    end

    redirect_to("/recommendations/#{rec.id}")
  end

  def show
    the_id = params.fetch("path_id")
    matching_recommendations = Recommendation.where({ :id => the_id })
    @the_recommendation = matching_recommendations.at(0)

    render({ :template => "recommendations/show" })
  end

  def destroy
    the_id = params.fetch("path_id")
    the_recommendation = Recommendation.where({ :id => the_id }).at(0)
    the_recommendation.destroy
    redirect_to("/recommendations", { :notice => "Recommendation deleted successfully." })
  end

  private

  def load_categories
    @categories = Category.all
  end
end
