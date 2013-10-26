class Category < ActiveRecord::Base
  attr_accessible :description, :name, :option
  has_many :articles
end
