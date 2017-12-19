# http://localhost:4567/
# myapp.rb
require 'sinatra'
#http://localhost:4567
get '/' do
  send_file 'index.html'
end
# url에  :name을 쓰면 params[:name]으로 받을 수 있다.
# 예시 ) /welcome/gira params[:name] == 'gira'
#http://localhost:4567/welcome
get '/welcome' do
  send_file 'welcome.html'
end

get '/welcome/:name' do
  @name = params[:name]
  erb :welcome
end
get '/square/:num' do
  @num = params[:num]
  erb :hello
end

get '/6' do
  #erb는 views 폴더에서 가져온다
  erb :hello #심보올~
end


get '/lotto' do
  @lotto = (1...45).to_a.sample(6)
  erb :lotto
end

get '/google' do
  erb :google
end
get '/search' do
  @q = params[:q]
  @name = params[:name]
  erb :search
end

get '/lunch' do
  @lunch =["멀캠식당", "순남시래기","명동칼국수","강남목장","대독장"].sample
  @img_url = {
    "멀캠식당" => "https://scontent.cdninstagram.com/t51.2885-15/e35/20987024_1431422050287339_2004189507347283968_n.jpg",
    "순남시래기" => "",
    "명동칼국수" => "http://www.menupan.com/restaurant/restimg/002/zzmenuimg/h1199225_z.jpg",
    "강남목장" => "",
    "대독장" => "http://here.busan.com/data/file/food_hear/3660937063_BZK9JsGH_20150325_104326.png",
  }
  erb :lunch
end

get '/sadari' do
  erb :sadari
end

get '/sadariend' do
  @name = params[:name]
  @sadari = ["1번", "2번", "3번", "4번"].sample
  
  erb :sadariend
end
