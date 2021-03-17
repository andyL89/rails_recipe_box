Rails.application.routes.draw do
  root to: 'recipes#index'
  resources :recipes do
    resources :ingredients, :tags
  end
  resources :tags do
    resources :recipes
  end
  resources :ingredients do
    resources :recipes
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
