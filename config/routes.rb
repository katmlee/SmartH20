Rails.application.routes.draw do
  root :to => 'pages#home'
  resources :users do
    resources :records
    resources :totals
  end

  get '/users/edit'
  get '/submit_reading' => 'records#submit_reading', :as => 'submit_reading'


  get '/todayData' => 'totals#today'
  get '/historicalData' => 'totals#historical'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
