#0.file.rb 의 위치는 rubyclass폴더안에있다.

#1. text폴더로 들어간다
Dir.chdir("text")
#2. 파일을 열어서 내용을 입력한다.
#2-1. #{i}를 쓰면 별도로 스트링을 안써도 가능
20.times do |i|
  i = i+1
  File.open("newfile#{i}.txt", "w+")do |file|
    file.write("hello world!")
  end
end
