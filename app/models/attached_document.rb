class AttachedDocument
  include Mongoid::Document
  include Mongoid::Paperclip

  belongs_to :page
  belongs_to :blog_post

  has_mongoid_attached_file :documents

  rails_admin do
    visible false
    list do
    end
    edit do
      field :documents
    end
  end
end