CseppCsk::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users
    
  devise_scope :user do
    get "sign_in", :to => "devise/sessions#new"
    get "profile", :to => "devise/passwords#edit"
  end

  match "blog" => "pages#index"
  match ":title" => "pages#show", as: "page_show"

  resources :pages do
    get :document, on: :member
  end

  match 'assets/:model/:id/:filename' => 'assets#show'

  root :to => "pages#show"
end
