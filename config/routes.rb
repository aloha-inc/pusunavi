Rails.application.routes.draw do
  get 'rankings/index'
  get 'about/index'
	get "/" => "homes#top"
  # get "/about" => "homes#about"
  # get "/ranking" => "homes#ranking"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
