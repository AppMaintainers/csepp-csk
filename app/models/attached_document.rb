class AttachedDocument
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :page
  belongs_to :blog_post

  mount_uploader :document, DocumentUploader

  after_save do
    destroy if document.blank?
  end

  rails_admin do
    visible false
    list do
    end
    edit do
      field :document
    end
  end
end