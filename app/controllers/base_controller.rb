# Homepage
get '/' do
  erb :index
end

# For pinging
get '/status' do
  'OK'
end
