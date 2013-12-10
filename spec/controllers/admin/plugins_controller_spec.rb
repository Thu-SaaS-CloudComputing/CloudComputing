require 'spec_helper'

describe Admin::PluginsController do
  before :each do
    @plugin_1 = FactoryGirl.create(:plugins, description: 'plugin 1', enable: false, id: 1, name: 'plugin1',link: 'http://test')
    session[:admin_auth] = Time.now
  end

  describe "Plugins index" do
    it "should goto plugins index" do
      get 'index'
      response.should render_template('admin/plugins/index')
    end
  end

  describe "Plugins enable" do
    it "should be able to enable/disable a plugin" do
      @plugin_1.should_receive(:update_attributes!)
      Plugins.should_receive(:find).with('1').and_return(@plugin_1)
      get 'toggle_enable', {:id => 1}
    end
  end

end
