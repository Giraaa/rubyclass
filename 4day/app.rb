require 'sinatra'
require 'sinatra/reloader'
require 'csv'
require 'date'
require 'nokogiri'
require 'httparty'
require 'uri'


get '/' do
  'hello world!'
  erb :index
end

get '/welcome/:name' do
  @name = params[:name]
  @time = Time.now.to_s
  #csv는 require 'csv'
  CSV.open('user.csv', 'a+') do |csv| #a+는 추가모드 w만들기 r읽기 등등
    csv << [@name.to_s, @time ] # << array할때나온거임
  end
  erb :welcome
end

get '/users' do
  @users = []
  CSV.foreach('user.csv') do |row|
    @users << row
  end
  erb :users
end
get '/lolfinder' do
  erb :lolfinder
end


get '/lol' do
  username = params[:username]
  url = "http://www.op.gg/summoner/userName=#{username}"
  url = URI.encode(url) #한글 url 을 인코딩 한다
  response = HTTParty.get(url) #httparty를 활용하여 요청보냄
  doc = Nokogiri::HTML(response) #노꼬기리록 검색하기 편하게 바꾼다.
  @win = doc.css("#SummonerLayoutContent > div.tabItem.Content.SummonerLayoutContent.summonerLayout-summary > div.SideContent > div.TierBox.Box > div.SummonerRatingMedium > div.TierRankInfo > div.TierInfo > span.WinLose > span.wins")
  @lose = doc.css("#SummonerLayoutContent > div.tabItem.Content.SummonerLayoutContent.summonerLayout-summary > div.SideContent > div.TierBox.Box > div.SummonerRatingMedium > div.TierRankInfo > div.TierInfo > span.WinLose > span.losses")
  erb :lol
end
get '/result' do
  @count = params[:count]
  erb :result
end


get '/vote' do

  erb :vote
end
