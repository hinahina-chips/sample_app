Rails.application.routes.draw do
  get '/top' => 'homes#top' #homes部分が
  resources :lists
end

#追加するURLと定義したhomes_controller.rbのアクション名が同じなら省略可能
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
