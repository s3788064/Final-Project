Rails.application.routes.draw do

  resources :questions
  root 'questions#question1'

  get '/question1', to: "questions#question1"

  get '/question2', to: "questions#question2"

  post '/answer', to: "questions#answer"

  get 'static_pages/home'
  get 'static_pages/help'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
