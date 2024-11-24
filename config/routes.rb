Rails.application.routes.draw do
  namespace :project do
    resources :events, only: %i[index create update]
    resources :todo_lists, only: %i[new index show edit update]
    resources :chats, only: %i[index show]
    resources :message_boards, param: :message_id, only: %i[index show] do
      collection do
        get "drafts"
      end
    end

    resources :messages, only: %i[new create update destroy edit] do
      resources :comments, only: %i[create destroy]
    end
    resources :settings, only: %i[index update destroy]
    post "/message_boards", to: "message_boards#index"
    get "dashboard/:project_id", to: "dashboard#index"
  end

  resources :projects, only: %i[index new create]
  devise_for :users, path: ""

  root "static_pages#home"

  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
