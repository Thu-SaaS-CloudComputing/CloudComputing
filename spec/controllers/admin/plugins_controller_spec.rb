require 'spec_helper'

describe Admin::PluginsController do
  before :each do
    @plugin_1 = FactoryGirl.create(:plugins, description: 'plugin 1', enable: false, id: 1, name: 'plugin1',link: 'http://test')
    session[:admin_auth] = Time.now
    AdminController.any_instance.stub(:authorize).and_return(true)
  end

  describe "Plugins index" do
    it "should goto plugins index" do
      result = double("result")
      Plugins.should_receive(:all).and_return(result)
      get 'index'
      expect(assigns(:plugins)).to eq(result)
      #response.should render_template("")
    end
  end
p
  describe "Plugins enable" do
    it "should be able to enable/disable a plugin" do
      @plugin_1.should_receive(:update_attributes!)
      Plugins.should_receive(:find).with('1').and_return(@plugin_1)
      get 'toggle_enable', {:id => 1}
    end
  end

end
