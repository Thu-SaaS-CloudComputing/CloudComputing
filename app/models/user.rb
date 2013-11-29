class User < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :studentID
  has_and_belongs_to_many :priviledges

  def has_priviledge?(priviledge)
    self.priviledges.exists?(priviledge)
  end

  def self.temporary_user
    if session.has_key?(:user)
      return User.find(session[:user].id)
    else
      return nil
    end
  end
end
