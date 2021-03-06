Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get '/' => 'pages#home', as: 'home'
  get '/brrr' => 'twitch#brrr'
  get '/mcmods' => 'pages#mcmods'
  get '/resume' => 'pages#resume'
  get '/happynothappy' => 'pages#hnh'
  post '/happynothappy' => 'pages#hnh_r'
end
