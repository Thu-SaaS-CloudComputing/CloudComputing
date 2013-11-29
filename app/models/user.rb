class User < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :studentID
  has_and_belongs_to_many :priviledges

  def has_priviledge?(priviledge)
    self.priviledges.exists?(priviledge)
  end
end
