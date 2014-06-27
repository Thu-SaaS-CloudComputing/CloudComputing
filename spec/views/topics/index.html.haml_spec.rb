require 'spec_helper'

describe "topics/index" do
  before(:each) do
    assign(:topics, [
      stub_model(Topic),
      stub_model(Topic)
    ])
  end

  it "renders a list of topics" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
