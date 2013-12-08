class User < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :studentID
  has_and_belongs_to_many :priviledges
  #validate :user_management?

  def self.valid?(student_id)
    if User.find_by_studentID(student_id)
      return true
    else
      return false
    end
  end

  def has_priviledge?(priviledge)
    self.priviledges.include?(priviledge)
  end

  #def self.temporary_user
  #  if session.has_key?(:user)
  #    return User.find(session[:user].id)
  #  else
  #   return nil
  #  end
  #end

#private

  #def user_management?
  #  tem_user = User.find_by_studentID(session[:user])
  #  tem_user.priviledges.include?("user_management")
  #end
end
