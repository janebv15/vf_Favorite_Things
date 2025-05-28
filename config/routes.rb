Rails.application.routes.draw do
  # Routes for the Follow request resource:
#Home landing page -->>> need to create




#Profile page -->>> need to create



#-----------
  # CREATE
  post("/insert_follow_request", { :controller => "follow_requests", :action => "create" })
          
  # READ
  get("/follow_requests", { :controller => "follow_requests", :action => "index" })
  
  get("/follow_requests/:path_id", { :controller => "follow_requests", :action => "show" })
  
  # UPDATE
  
  post("/modify_follow_request/:path_id", { :controller => "follow_requests", :action => "update" })
  
  # DELETE
  get("/delete_follow_request/:path_id", { :controller => "follow_requests", :action => "destroy" })

  #------------------------------

  # Routes for the Category resource:

  # CREATE
  post("/insert_category", { :controller => "categories", :action => "create" })
          
  # READ
  get("/categories", { :controller => "categories", :action => "index" })
  
  get("/categories/:path_id", { :controller => "categories", :action => "show" })
  
  # UPDATE
  
  post("/modify_category/:path_id", { :controller => "categories", :action => "update" })
  
  # DELETE
  get("/delete_category/:path_id", { :controller => "categories", :action => "destroy" })

  #------------------------------

  # Routes for the Recommendation resource:

  # CREATE
  post("/insert_recommendation", { :controller => "recommendations", :action => "create" })
          
  # READ
  get("/recommendations", { :controller => "recommendations", :action => "index" })
  
  get("/recommendations/:path_id", { :controller => "recommendations", :action => "show" })
  
  # UPDATE
  
  post("/modify_recommendation/:path_id", { :controller => "recommendations", :action => "update" })
  
  # DELETE
  get("/delete_recommendation/:path_id", { :controller => "recommendations", :action => "destroy" })

  #------------------------------

  devise_for(:users)

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first" # get / in home controller def index
  root to: "home#index"
  

  # profile

  get("/profile/:id", { 
  :controller => "home", 
  :action     => "profile", 
  :as         => "profile" 
})

end
