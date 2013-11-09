class Category < ActiveRecord::Base

  attr_accessible :description, :name, :option, :parent, :order
  # parent is its parent's id, pointing to a category record. 0(default) for root categories.
  
  has_many :articles
  serialize :option, Hash
  
  after_create :set_order_attribute

  def set_order_attribute
    self.order = id if order.nil?
    self.save
  end
  
  def push_sub_categories(category_list, repeat)
    Category.find_all_by_parent(id).each do
      |sub_category|
      category_list << {:prefix => "> " * repeat + "- ", :content => sub_category}
      sub_category.push_sub_categories(category_list, repeat + 1)
    end
  end
  
  def self.find_top_categories
    Category.find_all_by_parent(0)
  end

  def self.find_sub_categories(parent)
    Category.find_all_by_parent(parent)
  end
end
