Rails.application.routes.draw do
  resources :schools
  get 'rankings/index'
  get 'about/index'
	get "/" => "homes#top"
  get "/about" => "about#index"
  get "/rankings" => "rankings#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
