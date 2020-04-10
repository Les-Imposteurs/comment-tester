Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/contact', to: 'contact_form_submissions#new'
  get '/thank_you', to: 'contact_form_submissions#thank_you'
  resources :contact_form_submissions, only: [:create]
end
