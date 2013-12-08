class Admin::CarouselController < ApplicationController
  def index
    @carousels=Carousel.all
  end
  def add
    carousel = Carousel.new
    carousel.title = params[:title]
    carousel.link = params[:link]
    carousel.picture = params[:picture]
    carousel.order = Carousel.all.count + 1
    carousel.save!
    render :json => { :status => 'success' }.to_json
  end
  def destroy
    carousel = Carousel.find params[:id]
    carousel.destroy
    redirect_to admin_carousel_index_path
  end
end
