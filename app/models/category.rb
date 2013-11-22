class Category < ActiveRecord::Base

attr_accessible :description, :name, :option, :parent, :order, :show_on_index
  # parent is its parent's id, pointing to a category record. 0(default) for root categories.
  
  has_many :articles
  serialize :option, Hash
  
  after_create :set_order_attribute, :set_show_on_index_attribute

  def tree_plant()
    sub_cat = Category.find_sub_categories(self.id)
    result = Array.new

    if sub_cat
      sub_cat.each do |cat|
        result << cat.tree_plant
      end
      return {self.name.to_sym => result}
    else
      return self.name
    end
  end

  def set_order_attribute
    self.order = id if order.nil?
    self.save
  end
  
  def set_show_on_index_attribute
    if self.parent == 0 && self.show_on_index != 'shown'
      self.show_on_index = 'hidden'
    elsif self.parent != 0
      self.show_on_index = 'unavailable'
    end
    self.save
  end
  
  def switch_show
    if self.show_on_index == 'shown'
      self.show_on_index = 'hidden'
    elsif self.show_on_index == 'hidden'
      self.show_on_index = 'shown'
    end
    self.save
  end
  
  def push_sub_categories(category_list, repeat)
    Category.find_sub_categories(id).each do
      |sub_category|
      category_list << {:prefix => "> " * repeat + "- ", :content => sub_category}
      sub_category.push_sub_categories(category_list, repeat + 1)
    end
  end
  
  def self.find_top_categories
    Category.find_all_by_parent(0, :order => '"order"')
  end
  
  def self.find_top_categories_to_show
    temp = []
    Category.find_all_by_parent(0, :order => '"order"').each do |cat|
      if cat.show_on_index == 'shown'
        temp += [cat]
      end
    end
    return temp
  end

  def self.find_sub_categories(parent)
    Category.find_all_by_parent(parent, :order => '"order"')
  end

  def self.category_tree
    cat_tree = Category.find_top_categories
    cat_tree.each do |cat|
      cat = cat.tree_plant()
    end
  end
end
