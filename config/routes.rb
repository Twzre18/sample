Rails.application.routes.draw do
  #get 'stocks/index'
  get '/stocks', to: 'stocks#index' # add this line

  #get 'blogs/index'
  get '/', to: 'blogs#index' # add this line
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :blogs do
    collection do
      post :confirm
    end
  end
  
end
