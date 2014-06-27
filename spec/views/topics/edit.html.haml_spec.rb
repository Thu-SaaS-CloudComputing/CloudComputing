require 'spec_helper'

describe "topics/edit" do
  before(:each) do
    @topic = assign(:topic, stub_model(Topic))
  end

  it "renders the edit topic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", topic_path(@topic), "post" do
    end
  end
end
