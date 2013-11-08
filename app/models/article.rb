class Article < ActiveRecord::Base
  belongs_to :category
  attr_accessible :author, :title, :category, :content
end
