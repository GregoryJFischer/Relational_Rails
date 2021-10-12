Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/', to: 'orchestras#index'
  get '/', to: 'musicians#index'
  get '/', to: 'composers#index'
  get '/', to: 'songs#index'
end
