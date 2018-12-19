Rails.application.routes.draw do
  get 'welcome/index'
  resources :articles
  resources :welcome
  root 'welcome#index'
end
