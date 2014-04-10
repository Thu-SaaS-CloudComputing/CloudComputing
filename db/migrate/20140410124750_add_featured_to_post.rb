class AddFeaturedToPost < ActiveRecord::Migration
  def change
    add_column :posts, :featured, :bool
    add_column :posts, :pinned, :bool
  end
end
