class Admin::PluginsController < AdminController
  def index
    @plugins = Plugins.all
  end
  def toggle_enable
    id = params[:id]
    plugin = Plugins.find(id)
    enable = plugin.enable
    puts plugin
    plugin.update_attributes!(:enable=>!enable)
    render :json => {:enable => !enable}.to_json
  end
end
