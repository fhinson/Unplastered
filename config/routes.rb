Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout', :sign_up => 'signup', :edit => 'settings'}

  resources :users do
    member do
      get :refresh
    end
  end

  root 'base#index'

  get 'history/' => 'base#history'
  post 'twilio/voice' => 'twilio#voice'

  resources :drinks, :except => [:index, :show, :edit]

  post 'twilio/voice' => 'twilio#voice'
end
