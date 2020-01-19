Rails.application.routes.draw do
  root to: 'welcome#home'
  get '/about', to: 'welcome#about'
  resources :articles
end
