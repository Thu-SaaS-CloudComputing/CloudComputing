class Admin::PluginsController < AdminController
  def index
    @plugins = Plugins.all
  end
  def enable
  end
end
