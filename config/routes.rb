Rails.application.routes.draw do
  namespace :api do # makes sure it knows to look in the api folder
    namespace :v1 do # makes sure it knows to look in the v1 folder
      resources :queries, only: [:index, :show, :create] # allows for all nessisary end points for basic queries
      post '/queries/sentence', to: 'queries#create_rhyme_sentence' # allows for end point for special sentence rhyming queries
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
