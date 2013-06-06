class AssetsController < ApplicationController
  def show
    if params[:model] == 'attached_picture'
      container = AttachedPicture.find(params[:id])
      if params[:version] && ['medium', 'thumb'].include?(params[:version])
        content = container.picture.send(params[:version].to_sym).read
      else
        content = container.picture.read
      end
      type = container.picture.file.content_type
    elsif params[:model] == 'attached_document'
      container = AttachedDocument.find(params[:id])
      content = container.document.read
      type = container.document.file.content_type
    end
    # TODO: missing content types, fix this!
    type ||= 'image/jpg'

    if stale?(etag: content, last_modified: container.updated_at.utc, public: true)
      send_data content, type: type, disposition: "inline"
      expires_in 0, public: true
    end
  end
end
