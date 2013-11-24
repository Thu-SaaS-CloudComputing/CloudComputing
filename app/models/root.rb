class Root < ActiveRecord::Base
  attr_accessible :username, :password
  
  def self.auth(username, password)
    return self.where("username = ? AND password = ?", username, password) != []
  end
  
end
