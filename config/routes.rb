Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/orchestras/', to: 'orchestras#index'
  get '/orchestras/new', to: 'orchestras#new'
  post '/orchestras', to: 'orchestras#create'

  get '/musicians/', to: 'musicians#index'
  get '/musicians/new', to: 'musicians#new'
  post '/musicians', to: 'musicians#create'

  get '/composers/', to: 'composers#index'
  get '/composers/new', to: 'composers#new'
  post '/composers', to: 'composers#create'

  get '/songs/', to: 'songs#index'
  get '/songs/new', to: 'songs#new'
  post '/songs', to: 'songs#create'
  
end
