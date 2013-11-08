class Category < ActiveRecord::Base
  attr_accessible :description, :name, :option, :parent # parent is its parent's id, pointing to a category record. 0(default) for root categories.
  # order key to be added, for the user may alter the order of the categories.
  has_many :articles
  serialize :option, Hash
end
