class Comment < ActiveRecord::Base
  belongs_to :user #하나에 속해있기때문에 단수로 써야함
end
