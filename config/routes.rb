Marcgg::Application.routes.draw do
  get "website/index"

  root :to => 'website#index'
end
