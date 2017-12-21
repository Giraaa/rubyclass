class UserController < ApplicationController

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])

    @user.update(
      username: params[:username],
      title: params[:title],
      content: params[:content])


      redirect_to "/"
  end

  def edit
    @user = User.find(params[:id])

  end
  def edit_commnet
    @comment = Comment.find(params[:id])

  end

  def create
    @user = User.create(
      username: params[:username],
      title: params[:title],
      content: params[:content]
    )

    redirect_to '/'
  end

  def new
  end

  def destroy
    User.find(params[:id]).destroy

    redirect_to '/'
  end
  def destroy_comment
    Comment.find(params[:id]).destroy

    redirect_to '/'
  end

  def show
    @user = User.find(params[:id])
  end

  def add_coment
    Comment.create(
      content: params[:content],
      user_id: params[:id]
    )
    redirect_to :back
  end

end
