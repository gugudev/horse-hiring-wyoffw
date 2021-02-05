Rails.application.routes.draw do

  get '/encode/*url' => 'home#encode', format: :json

  get "/:key" => 'home#decode', format: :json
  get "/decode/*url" => 'home#decode', format: :json

end
