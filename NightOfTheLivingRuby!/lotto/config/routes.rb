Lotto::Application.routes.draw do
  resources :contestants , :except => [ :edit , :update , :show ] do
    collection do
      get 'winner'
    end
  end
  
  root :to => 'contestants#index' 
  
end
