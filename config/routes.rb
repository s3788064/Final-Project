Rails.application.routes.draw do

  resources :questions
  root 'questions#question1'

  get '/question1', to: "questions#question1"

  get '/question2', to: "questions#question2"

  get '/question3', to: "questions#question3"

  get '/question4', to: "questions#question4"

  get '/results', to: "questions#results"

  post '/answer', to: "questions#answer"

  get 'static_pages/home'
  get 'static_pages/help'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
