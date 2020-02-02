Rails.application.routes.draw do
  # resources :prefectures
  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  get '/audio/index' => 'audio#index'
  get '/audio/tag/:id' => 'audio#tag'
  get '/audio/show/:id' => 'audio#show'
  get '/audio/search/:keyword' => 'audio#search'
  get '/audio/list/:id' => 'audio#list'
  get '/audio/form' => 'audio#form'
  post '/audio/create' => 'audio#create'
    post '/audio/searching' => 'audio#searching'

  post '/follow/create/:id' => 'follow#create'
  post '/follow/destroy/:id' => 'follow#destroy'

  get '/media/:id' => 'users#userlist'
  post '/friendlist/reply/destroy/:id' => 'friendlist#reply_destroy'
  post '/friendlist/reply/create/:id' => 'friendlist#reply_create'
  post '/friendlist/create/:id' => 'friendlist#create'
  post '/friendlist/destroy/:id' => 'friendlist#destroy'
  # get '/' => 'home#top'
  # get '/' => 'devise/resource#sign_up'
  get '/about' => 'home#about'

  post '/newcreate' => 'home#newcreate'
  get '/newform' => 'home#newform'

  get '/loginform' => 'home#loginform'
  post '/login' => 'home#login'

  get '/posts/index' => 'posts#index'
  get '/posts/show/:id' => 'posts#show'
  get '/posts/newpost' => 'posts#newpost'
  post '/posts/create' => 'posts#create'
  post '/posts/:id/image/show/:index' => 'posts#imgshow'
  get '/posts/editcontent/:id' => 'posts#editcontent'
  post '/posts/serching' => 'posts#serching'
  get '/posts/serch/:serch' => 'posts#serch'
  post '/posts/edit/:id' => 'posts#edit'
  post '/posts/destroy/:id' => 'posts#destroy'
  post '/posts/logout' => 'posts#logout'
  post '/posts/logout' => 'devise/sessions#destroy'

  post '/comment/create/:id' => 'comment#create'
  get '/comment/:id/show/:id' => 'comment#show'
  post '/comment/commentform/:id' => 'comment#commentform'

  get '/profile/:id' => 'users#userprofile'
  get '/like/:id' => 'users#like'
  get '/connect/:id' => 'users#follow'
  get '/connected/:id' => 'users#follower'
  get '/users/userlist' => 'users#userlist'
  get 'users/serch/:serch' => 'users#serch'
  post '/users/serching' => 'users#serching'
  get '/users/serch/:serch' => 'users#serch'
  get '/users/editprofile/:id' => 'users#editprofile'
  post '/users/edit/:id' => 'users#edit'
  get '/users/notice/:id' => 'users#notice'
  get '/users/genre/:id' => 'users#genre'
  get '/users/genre_edit' => 'users#genre_edit'

  post '/like/create/:id' => 'like#create'
  post '/like/destroy/:id' => 'like#destroy'

  get '/table/posts' => 'table#posts'
  get '/table/users' => 'table#users'
  get '/table/like' => 'table#like'
  get '/table/comment' => 'table#comment'
  get '/table/friendlist' => 'table#friendlist'
  get '/table/notices' => 'table#notices'
  get '/table/follow' => 'table#follow'
  get '/table/serch' => 'table#serch'
  get '/table/genre' => 'table#genre'
  get '/table/gender' => 'table#gender'
  get '/table/instrument' => 'table#instrument'
  get '/table/prefecture' => 'table#prefecture'
  get '/table/audio' => 'table#audio'
  get '/table/audio_tag' => 'table#audio_tag'
  get '/table/audio_tagmap' => 'table#audio_tagmap'

  get '/genre/new' => 'genre#new'
  get '/genre/edit/:id' => 'genre#edit'
  post '/genre/create' => 'genre#create'
  post '/genre/destroy' => 'genre#destroy'
  post '/genre/update/:id' => 'genre#update'

  post '/prefecture/update/:id' => 'prefecture#update'

  get '/gender/new' => 'gender#new'
  get '/gender/edit/:id' => 'gender#edit'
  post '/gender/create' => 'gender#create'
  post '/gender/destroy' => 'gender#destroy'
  post '/gender/update/:id' => 'gender#update'

  post '/serch/create' => 'serch#create'
  get '/search/:id/users' => 'serch#users'
  get '/search/:id/posts' => 'serch#posts'
  get '/search' => 'serch#serch'

  get '/instrument/new' => 'instrument#new'
  get '/instrument/edit/:id' => 'instrument#edit'
  post '/instrument/create' => 'instrument#create'
  post '/instrument/destroy' => 'instrument#destroy'
  post '/instrument/update/:id' => 'instrument#update'
  # get '/table/authentic_user' => 'table#authentic_user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
