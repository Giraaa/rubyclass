class HomeController < ApplicationController
  #action
  #app/views/컨트롤러이름/액션이름.html.erb
  #app/views/home/index.html.erb
  def index
  end

  def lotto
    @lotto = (1..45).to_a.sample(6).sort
  end

  def welcome
    @name = params[:name]
  end

  def square
    @num = params[:num]

  end

  def lunch
    @lunch = ["이자카야","소풍","양자강","옛날농원"].sample
    @img_url ={
      '양자강' => 'http://archivenew.vop.co.kr/images/4b3bd325788f47666ec36669c8aaf5d0/2010-09/30022229_04.gif',
      '이자카야' => 'http://cfile4.uf.tistory.com/image/2146424A53D9B832180E17',
      '옛날농원' => 'http://post.phinf.naver.net/MjAxNzA3MjdfMjk5/MDAxNTAxMTEzNjc1MTYw._t6Ywjn32DwO_NQbBkOwlcsCrzydZQD5avVW9h3-xWcg.jis__p9jYUCGdDVj898x_qZ-GHuZEDNK_nJcc4RqHq4g.JPEG/1500270485878.jpg?type=w1200',
      '소풍' => 'http://pds18.egloos.com/pds/201005/16/96/e0063996_4beff6954fc84.jpg'
    }
  end


  def search

  end

  def vote

  end

  def result
    @vote = params[:vote]
  end

  def christname
  end
  def christresult
    @name = params[:name]
    @gender = params[:gender]
    @christman = ["미카엘","요한","베드로","유다","루시퍼"].sample
    @christwoman = ["실비아", "미카엘라", "헬레나"]
  end
end
