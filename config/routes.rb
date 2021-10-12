Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/orchestras/', to: 'orchestras#index'
  get '/musicians/', to: 'musicians#index'
  get '/composers/', to: 'composers#index'
  get '/songs/', to: 'songs#index'
end
