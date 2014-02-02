class Article < ActiveRecord::Base
  belongs_to :category
  has_and_belongs_to_many :tags
  attr_accessible :author, :title, :category, :content

  def update_tags(all_tags)
    self.tags = all_tags
  end
end
