CseppCsk::Application.routes.draw do
  
  mount Rich::Engine => '/rich', :as => 'rich'

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users
    
  devise_scope :user do
    get "sign_in", :to => "devise/sessions#new"
    get "profile", :to => "devise/passwords#edit"
  end

  #root :to => "home#index"
end
