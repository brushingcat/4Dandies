Rails.application.routes.draw do
  filter :locale
  devise_for :users, :controllers => {:omniauth_callbacks =>
                                          "users/omniauth_callbacks"  },
             :skip => [:sessions, :registrations]

  devise_scope :user do
    get "/subscribe" => "users/registrations#new", :as => :new_user_registration
    post "/subscribe" => "users/registrations#create", :as => :user_registration
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root to: 'application#index'
  root 'application#index'
end
