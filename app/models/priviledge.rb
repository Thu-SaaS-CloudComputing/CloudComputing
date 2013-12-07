class Priviledge < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :description
  has_and_belongs_to_many :users
  #validate :validate?

  #def validate?
  #  tem_user = User.find_by_studentID(session[:user])
  #  tem_user.priviledges.include?("user_management")
  #end
end
