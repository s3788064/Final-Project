Rails.application.routes.draw do

  resources :questions
  root 'questions#question1'

  get '/question1', to: "questions#question1"

  get '/question2', to: "questions#question2"

  get '/question3', to: "questions#question3"

  get '/question4', to: "questions#question4"

  get '/question5', to: "questions#question5"

  get '/question6', to: "questions#question6"

  get '/question7', to: "questions#question7"

  get '/question8', to: "questions#question8"

  get '/results', to: "questions#results"

  post '/answer', to: "questions#answer"

  get 'static_pages/home'
  get 'static_pages/help'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
