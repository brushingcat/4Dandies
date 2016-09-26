Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks =>
                                           "users/omniauth_callbacks" },
             :skip => [:sessions, :registrations]

  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    devise_scope :user do
      root 'application#index'
      get "/subscribe" => "users/registrations#new", :as => :new_user_registration
      post "/subscribe" => "users/registrations#create", :as => :user_registration
    end
  end

  get '/blog', to: redirect('/blog'), as: 'blog'
  get '/brands', to: redirect('/brands'), as: 'brands'
  get '/facebook',
      to: redirect('https://www.facebook.com/4dandies/'),
      as: 'facebook'
  get '/instagram',
      to: redirect('https://www.instagram.com/4dandies/'),
      as: 'instagram'
  get '/google_plus',
      to: redirect('https://plus.google.com/u/0/b/100144721967412221214/100144721967412221214'),
      as: 'google_plus'
  get '/youtube',
      to: redirect('https://www.youtube.com/channel/UCdoe0MItp8CJd3x1axvo0XA'),
      as: 'youtube'
  get '/twitter',
      to: redirect('https://twitter.com/real4dandies'),
      as: 'twitter'
  get '/pinterest',
      to: redirect('https://pt.pinterest.com/4dandies/'),
      as: 'pinterest'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root to: 'application#index'

end
