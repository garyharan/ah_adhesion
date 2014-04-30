class AttachmentsController < ApplicationController

  def new
    @answer = Answer.find(params[:answer_id])
    render layout: false
  end

  def create
    @attachment = Attachment.find(params[:id])
    # FIXME: secure this
    if @attachment.update_attributes(attachment_params)
      head :ok
    else
      head 400
    end
  end
  
  private
    def attachment_params
      params.permit(:url, :filename, :filepath, :filesize, :filetype)
    end
end
