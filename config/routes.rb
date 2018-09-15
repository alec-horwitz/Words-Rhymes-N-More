Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :queries, only: [:index, :show, :create]
      post '/queries/sentence', to: 'queries#create_rhyme_sentence'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
