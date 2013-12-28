class AttachmentController < ApplicationController
  def index
    render :layout => false
  end
  
  def upload
    @att = Attachment.new()
    @att.attachment = params[:attachment]
    @att.save!
    render inline: "upload successfully, url & link: <br /><a href=#{@att.attachment.url}>#{@att.attachment.url}</a><br /><br /><a href=''>continue to upload</a>" and return
  end
end
