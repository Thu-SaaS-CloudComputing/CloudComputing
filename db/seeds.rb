# encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
categories = [{:name => '新闻', :description => '', :option => {}},
              {:name => '公告', :description => '', :option => {}},
]

categories.each do |category|
  Category.create!(category)
end

articles = [{:title => 'Test title', :author => 'admin', :category => Category.find_by_name('新闻')},
           {:title => '哈哈哈', :author => 'cgcgbcbc', :category => Category.find_by_name('公告')},
]

articles.each do |article|
  Article.create!(article)
end
