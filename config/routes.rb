Rails.application.routes.draw do
root to: "todo_lists#index"
resources :sessions, only: [:new, :create, :destroy]
resources :todo_lists do
  resources :todo_items
end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".





get "/login" => "sessions#new", as: "login"
delete "/logout" => "sessions#destroy", as: "logout"

end
