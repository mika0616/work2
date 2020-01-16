Rails.application.routes.draw do
# ルーティングtopページを表示
  root to: 'homes#top'
# viewが不要なnew以外をルーティング
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
