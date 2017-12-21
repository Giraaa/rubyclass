class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #모든 컨트롤러에 상속을 해주고 있기 때문에
  #application_controller.rb는 모든 컨트롤러에서 쓸 수 있음
  def current_member
    #현재 로그인에 되어있지 않습니다.
    if session[:member_id].nil?
      @member = nil
    else
      #현재 로그인되어있으며
      #세션에 id값 있으니까 찾아서 넣는다.
      @memeber = Member.find(session[:member_id])
    end
  end
  #view에서  보여주기 위해서는 컨트롤러에서 뷰로 넘겨야하는데
  # 헬퍼 메소드를 활용하여 바로 view에서 쓸 수 있도록 도리 수 있다.
  helper_method :current_member
end
