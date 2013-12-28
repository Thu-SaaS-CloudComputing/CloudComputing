class AddLinkToPlugins < ActiveRecord::Migration
  def change
    add_column :plugins, :link, :string
  end
end
