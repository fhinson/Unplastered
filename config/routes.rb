Rails.application.routes.draw do
  root 'base#index'

  resources :drinks, :except => [:index, :show, :edit]
end
