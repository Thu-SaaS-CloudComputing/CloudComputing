class Block < ActiveRecord::Base
  attr_accessible :name, :parent, :description
  has_many :posts
  def generate_topic_tree
    if self.parent == 0
      return [self]
    else
      parent_topic = Block.find(self.parent)
      return parent_topic.generate_topic_tree << self
    end
  end
end
