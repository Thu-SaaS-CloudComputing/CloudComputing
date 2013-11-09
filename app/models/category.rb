class Category < ActiveRecord::Base
  attr_accessible :description, :name, :option, :parent # parent is its parent's id, pointing to a category record. 0(default) for root categories.
  # order key to be added, for the user may alter the order of the categories.
  has_many :articles
  serialize :option, Hash

  def self.find_top_categories
    Category.find_all_by_parent(0)
  end

  def self.find_sub_categories(parent)
    Category.find_all_by_parent(parent)
  end
end
