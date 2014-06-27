require 'spec_helper'

describe "topics/show" do
  before(:each) do
    @topic = assign(:topic, stub_model(Topic))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
