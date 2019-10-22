Rails.application.routes.draw do
  get '/dns_records', to: 'dns_records#index'
  post '/dns_records', to: 'dns_records#create'
end
