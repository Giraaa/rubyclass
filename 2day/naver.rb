#요청을 보내기 위한 httparty
require "httparty"
#원하는 정보를 가져오기위한 nokogiri
require "nokogiri"

#1.네이버 국내증시 주소를 url에 저장한다.
url = "http://finance.naver.com/sise/"
#2.url을 통해서 요청한다.
response = HTTParty.get(url)
#3.가져온 문서를 nokogiri형식으로 저장한다. for 컴퓨터
doc = Nokogiri::HTML(response)
#4. 문서에서 css중 ID가 KOSPI_now인 것을 kospi라는 변수 안에 저장
#css를 가져오기위해서 크롬에서 copy selector
kospi = doc.css("#KOSPI_now")
#5. kospi안에 저장된 것 중에 태그 안에있는 텍스트를 출력한다.
puts kospi
