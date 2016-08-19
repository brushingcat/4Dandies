Rails.application.routes.draw do
  filter :locale
  devise_for :users, :controllers => {:registrations => "users/registrations",
                                      :omniauth_callbacks =>
                                          "users/omniauth_callbacks"  },
             :skip => :sessions

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'application#index'
end
