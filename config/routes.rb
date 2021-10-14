Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/orchestras/', to: 'orchestras#index'
  get '/orchestras/new', to: 'orchestras#new'
  get '/orchestras/:id', to: 'orchestras#show'
  get '/orchestras/:id/edit', to: 'orchestras#edit'
  get '/orchestras/:id/musicians', to: 'orchestras#musicians'
  post '/orchestras', to: 'orchestras#create'
  patch '/orchestras/:id', to: 'orchestras#update'
  delete '/orchestras/:id', to: 'orchestras#destroy'

  get '/musicians/', to: 'musicians#index'
  get '/musicians/new', to: 'musicians#new'
  get '/musicians/:id', to: 'musicians#show'
  get '/musicians/:id/edit', to: 'musicians#edit'
  post '/musicians', to: 'musicians#create'
  patch '/musicians/:id', to: 'musicians#update'
  delete '/musicians/:id', to: 'musicians#destroy'

  get '/composers/', to: 'composers#index'
  get '/composers/new', to: 'composers#new'
  get '/composers/:id', to: 'composers#show'
  get '/composers/:id/edit', to: 'composers#edit'
  get '/composers/:id/songs', to: 'composers#songs'
  post '/composers', to: 'composers#create'
  patch '/composers/:id', to: 'composers#update'
  delete '/composers/:id', to: 'composers#destroy'

  get '/songs/', to: 'songs#index'
  get '/songs/new', to: 'songs#new'
  get '/songs/:id', to: 'songs#show'
  get '/songs/:id/edit', to: 'songs#edit'
  post '/songs', to: 'songs#create'
  patch '/songs/:id', to: 'songs#update'
  delete '/songs/:id', to: 'songs#destroy'

end
