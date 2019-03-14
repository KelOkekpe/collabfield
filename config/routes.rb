Rails.application.routes.draw do

  #root(homepage) goes to pages_controller and calls index method
  root to: 'pages#index'


  resources :posts do
    collection do
      get 'hobby'
      get 'study'
      get 'team'
    end
  end

  #why doesnt there need to be a devise for logins?
  devise_for :users, :controllers => {:registrations => "registrations"}

  #if the user clicks the signup link, this is where they will be directed
  devise_scope :user do
    get 'signup', to: 'devise/registrations#new'
  end

  #if user clicks the login link, this is where they will be directed
  #why doesn't there need to be a sessions controller?
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

end
