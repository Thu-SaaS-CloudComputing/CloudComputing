class Carousel < ActiveRecord::Base
  attr_accessible :link, :order, :picture, :title
  mount_uploader :picture, CarouselUploader
end
