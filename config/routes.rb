Rails.application.routes.draw do
  resources :articles

  get :update_all_articles, to: "update_all_articles#index"
  root to: "articles#index"
end
