class AttachmentsController < ApplicationController

  def new
    @answer = Answer.find(params[:answer_id])
    render layout: false
  end

  def create
    # FIXME: secure this?
    @answer = Answer.find(params[:answer_id])
    @attachment = @answer.attachments.create!(attachment_params)

    render @attachment, layout: false, locals: { answer: @answer }
  end

  def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy!

    head :ok
  end

  private
    def attachment_params
      params.permit(:url, :filename, :filepath, :filesize, :filetype)
    end
end
