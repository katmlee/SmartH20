Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :users do
    resources :records
  end

  get '/users/edit'
  get '/submit_reading' => 'records#submit_reading', :as => 'submit_reading'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
