class Topic < ActiveRecord::Base
  attr_accessible :name, :parent, :description
  def self.find_sub_topics(topic_id)
    all_topics = Topic.all
    sub_topics = Array.new
    all_topics.each do |topic|
      if topic.parent == topic_id
        sub_topics << topic
      end
    end
    return sub_topics
  end

  def self.find_top_topics
    Toplic.find_by_parent(0)
  end

  def generate_topic_tree
    if self.parent == 0
      return [self]
    end
    parent_topic = Topic.find(self.parent)

    return  parent_topic.generate_topic_tree << self
  end
end
