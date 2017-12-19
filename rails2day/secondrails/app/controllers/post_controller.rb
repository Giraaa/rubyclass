class PostController < ApplicationController
  def index
    @posts = Post.all
  end



  def new

  end

  def create
    #@username = params[:username] 와 유사한 형식
    #1번 형식
    @post = Post.create(:username => params[:username],
                        :title => params[:title],
                        :content => params[:contnet]
                      )

    #2번형식
    # post = Post.new
    # post.username = params[:username]
    # post.title = params[:title]
    # post.content = params[:content]
    # post.save
    redirect_to '/'
  end


  end
