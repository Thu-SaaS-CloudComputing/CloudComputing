class User < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :studentID
  has_and_belongs_to_many :priviledges
  has_many :comments
  #validate :user_management?

  def self.set_user(user_id)
    user = User.find_by_studentID(user_id)
    if !user
      user = User.create!(:studentID => user_id, :name => "Unknown user")
    end
    return user
  end

  #def refresh
  #  session[:user] = self.studentID
  #  session[:user_timestamp] = Time.now
  #end

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
