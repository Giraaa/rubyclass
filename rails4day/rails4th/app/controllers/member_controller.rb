class MemberController < ApplicationController

  def index
    Member.all
  end


  def new
    #사용자에게 form 창을 보여주는곳
  end

  def create
    Member.create(
      name: params[:name],
      email: params[:email],
      password: params[:password]
    )
    @member = Member.last
    #정보를 받아서 데이터베이스에서 만드는곳
  end



  def login

  end

  def login_process
    #0.params :email params :name params :password
    @member = Member.find_by(email: params[:email])
    #1. mail주소가 우리 db에 없으면 (가입한적이 없으면)
    if @member.nil?
    # 1-1. 없는아이디일시 -> 회원가입
      flash[:alert] = "존재하지 않는 회원입니다. 가입해주세요."
      redirect_to '/member/new'
    # 1-2. mail은 있지만 비밀번호를 확인
    else
    # 2-1. 맞으면 로그인
      if @member.password == params[:password]
        session[:member_id] = @member.id
        flash[:notice] = "#{@member.name}님 로그인에 성공하셨습니다."
        #노티쓰랑 얼랏은 루비에서 약속같은 존재임 다른것도상관없긴함
        redirect_to '/'
      # 틀리면 비밀번호가 틀렸다고 언급
      else
        flash[:alert] = "비밀번호가 틀렸습니다."
        redirect_to :back
      end
    end
  end
  def logout
    session.clear
    redirect_to '/'
  end

end
