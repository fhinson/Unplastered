Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout', :sign_up => 'signup', :edit => 'settings'}
  root 'base#index'

  resources :drinks, :except => [:index, :show, :edit]
end
