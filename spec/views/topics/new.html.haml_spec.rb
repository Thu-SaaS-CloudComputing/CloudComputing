require 'spec_helper'

describe "topics/new" do
  before(:each) do
    assign(:topic, stub_model(Topic).as_new_record)
  end

  it "renders new topic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", topics_path, "post" do
    end
  end
end
