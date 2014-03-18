class Post < ActiveRecord::Base
	has_many :comments, dependant: :destory
end
