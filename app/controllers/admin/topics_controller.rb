class Admin::TopicsController < AdminController
  def index
    @topics = Topic.all
  end

  def show
    @topics = Topic.all
  end

  def new_sub
    Topic.create!(:name => "new Topic", :parent => params[:id])
    redirect_to admin_topic_path()
  end

  def upward
    tem_topic = Topic.find(params[:id])
    topics = Topic.find_by_parent(tem_topic.parent)
    topics.sort_by!{|top| top.order}
    last = nil
    topics.each do |top|
      if(top == tem_topic and last != nil)
        tem = top.order
        top.order = last.order
        last.order = tem
        top.save!
        last.save!
      end
      last = top
    end
  end

  def downward
    tem_topic = Topic.find(params[:id])
    topics = Topic.find_by_parent(tem_topic.parent)
    topics.sort_by!{|top| top.order}
    last = nil
    topics.each do |top|
      if(last == tem_topic)
        tem = top.order
        top.order = last.order
        last.order = tem
        top.save!
        last.save!
      end
      last = top
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic.update_attributes!(params[:topic])
    flash[:notice] = "#{@topic.name} was successfully updated!"
    redirect_to admin_topic_path
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    flash[:notice] = "Topic #{@topic.name} deleted!"
    redirect_to admin_topic_path
  end
end
