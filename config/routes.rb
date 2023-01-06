Rails.application.routes.draw do
  get ?/, to: redirect("sharx")
  get "sharx", to: "sharx#index"
  get "sharx/new", to: "sharx#new"
  get "sharx/about", to: "sharx#about"
  post "sharx/create", to: "sharx#create"
  get "sharx/download/:id", to: "sharx#download", id: /.+/i
  get "sharx/:id", to: "sharx#show", constraints: {id: /.+/i}
end