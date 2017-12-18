require 'sinatra'
require 'sinatra/reloader'
require 'nokogiri'
require 'httparty'
require 'data_mapper'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/blog.db")

class Post
  include DataMapper::Resource
  #id는 고유한 값이고
  property :id, Serial
  #title은 string타입 길이는 50
  property :title, String
  #content는 text타입 string보다 많이 긴 문자열
  property :content, Text
  #자동 날짜시간을 저장한다
  property :created_at, DateTime
end

# Perform basic sanity checks and initialize all relationships
# Call this when you've defined all your models
# 모델(db) 설정이 끝났다
DataMapper.finalize
# automatically create the post table
# 설정이 끝났으니 테이블을 만들어줘! (테이블이 뿅)
Post.auto_upgrade!

set :bind, '0.0.0.0'

get '/' do
  @posts = Post.all
  erb :index
end
#게시글을 만드는곳
get '/new' do
  erb :new
end
#게시글을 저장하는곳(db에 저장하는곳)
get '/create' do
  #form에서 파람즈 해쉬가 넘어오는데
  #인풋/텍스트 에어이리어에 네임으로 설정된것
  #p params
  #=> title => 우리가 입력한것 content => 유저가 검색한 것
  @title = params[:title]
  @content = params[:content]
  #맨 위에 데이터 맵퍼에 설정한 내용
  #post라는 db에 칼럼에 있는 칼럼명에 해당하는 것
  Post.create(:title => @title, :content =>@content)
  #erb :create
  redirect '/'
end

get '/posts/:id' do
  @post = Post.get(params[:id])
  erb :posts
end
