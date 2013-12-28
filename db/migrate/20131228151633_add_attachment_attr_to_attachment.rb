class AddAttachmentAttrToAttachment < ActiveRecord::Migration
  def change
    add_column :attachments, :attachment, :string
  end
end
