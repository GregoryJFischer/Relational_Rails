Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/orchestras/', to: 'orchestras#index'
  get '/orchestras/new', to: 'orchestras#new'
  get '/musicians/', to: 'musicians#index'
  get '/musicians/new', to: 'musicians#new'
  get '/composers/', to: 'composers#index'
  get '/composers/new', to: 'composers#new'
  get '/songs/', to: 'songs#index'
  get '/songs/new', to: 'songs#new'

end
