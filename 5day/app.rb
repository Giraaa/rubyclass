require 'sinatra'
require 'sinatra/reloader'
require 'csv'
require 'date'
require 'nokogiri'
require 'httparty'
require 'uri'


get '/' do
  send_file "index.html"
end

get '/post' do
  erb :post
end

get '/complete' do
  @title = params[:title]
  @write = params[:write]
  CSV.open('text.csv','a+:UTF-8') do |csv|
    csv << [@title, @write ]
  end
  erb :complete
end

get '/text' do
  @text = []
  CSV.foreach('text.csv', encoding: 'UTF-8') do |row|
    @text << row
  end
  erb :text
end

get '/signup' do
  erb :signup
end

get '/completesign' do
  @id = params[:id]
  @pw = params[:password]
  @pwd = params[:passworde]
  CSV.open('member.csv','a+:UTF-8') do |csvv|
    csvv << [@id, @pw ]
  end
  if @pwd == @pw
    erb :completesign
  else
    redirect '/signup'
  end
end

get '/memberlist' do
  @memberlist = []
  CSV.foreach('member.csv', encoding: 'UTF-8') do |row|
    @memberlist << row
  end
  erb :memberlist
end
