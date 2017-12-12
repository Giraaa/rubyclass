require 'sinatra'
require 'sinatra\reloader'

get '/' do
  'this is main page'
  erb :index
end


get '/hotclip' do
  erb :hotclip
end

get '/movie' do
  movie = params[:moviename]
  if movie == '트와이스'
    @video = 'https://www.youtube.com/embed/rRzxEiBLQCA'
  elsif movie == '빅뱅'
    @video = "https://www.youtube.com/embed/iIPH8LFYFRk"
  else
    @video ="https://www.youtube.com/embed/lnXXfYA91Y8"
  end
  erb :movie
end
