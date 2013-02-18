CseppCsk::Application.routes.draw do

  namespace :public do
    resources :page, only: [:index, :show]
    #get "page/index"
    #get "page/show"
  end

  mount Rich::Engine => '/rich', :as => 'rich'

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users
    
  devise_scope :user do
    get "sign_in", :to => "devise/sessions#new"
    get "profile", :to => "devise/passwords#edit"
  end

  #root :to => "home#index"
end
