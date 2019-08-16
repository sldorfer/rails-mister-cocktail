Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails do
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:destroy]
end


# step  1: For the resources this information has already been stored from the nesting
# id
# description
# cocktail
# ingredient

# /cocktails/:cocktail_id/doses/new
