class User < ActiveRecord::Base
  # 댓글'들'을 가지고 있다.
  has_many :comments 
  #한개의 포스트에 여러개 코멘트를가지기때문에
  # 복수형을씀
end
