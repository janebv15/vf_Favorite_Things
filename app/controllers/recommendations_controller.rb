class RecommendationsController < ApplicationController
  def index
    matching_recommendations = Recommendation.all

    @list_of_recommendations = matching_recommendations.order({ :created_at => :desc })

    render({ :template => "recommendations/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_recommendations = Recommendation.where({ :id => the_id })

    @the_recommendation = matching_recommendations.at(0)

    render({ :template => "recommendations/show" })
  end

  def create
    the_recommendation = Recommendation.new
    the_recommendation.user_id = params.fetch("query_user_id")
    the_recommendation.category_id = params.fetch("query_category_id")
    the_recommendation.name = params.fetch("query_name")
    the_recommendation.description = params.fetch("query_description")

    if the_recommendation.valid?
      the_recommendation.save
      redirect_to("/recommendations", { :notice => "Recommendation created successfully." })
    else
      redirect_to("/recommendations", { :alert => the_recommendation.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_recommendation = Recommendation.where({ :id => the_id }).at(0)

    the_recommendation.user_id = params.fetch("query_user_id")
    the_recommendation.category_id = params.fetch("query_category_id")
    the_recommendation.name = params.fetch("query_name")
    the_recommendation.description = params.fetch("query_description")

    if the_recommendation.valid?
      the_recommendation.save
      redirect_to("/recommendations/#{the_recommendation.id}", { :notice => "Recommendation updated successfully."} )
    else
      redirect_to("/recommendations/#{the_recommendation.id}", { :alert => the_recommendation.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_recommendation = Recommendation.where({ :id => the_id }).at(0)

    the_recommendation.destroy

    redirect_to("/recommendations", { :notice => "Recommendation deleted successfully."} )
  end
end
