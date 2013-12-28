require 'carrierwave/orm/activerecord'
class Attachment < ActiveRecord::Base
  mount_uploader :attachment, AttachmentUploader
  attr_accessible :attachment
end
