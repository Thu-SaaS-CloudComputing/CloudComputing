class Tag < ActiveRecord::Base
  validates_uniqueness_of :name
  attr_accessible :name
  has_and_belongs_to_many :articles

  def self.get_all_articles(name)
    tag = Tag.find_by_name(name)
    if tag
      return tag.articles
    else
      return nil
    end
  end

  def self.sanitize(tag_string)
    tags = tag_string.split(',')
    result = Array.new
    tags.each do |tag_name|
      tag = Tag.find_by_name(tag_name.strip)
      if tag
        result << tag
      else
        tag = Tag.create({:name => tag_name})
        result << tag
      end
    end
    return result
  end

end
