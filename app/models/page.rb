class Page
  include Mongoid::Document
  include Mongoid::Slug
  include Mongoid::Userstamp
  include Mongoid::Paperclip

  has_mongoid_attached_file :pictures
  has_mongoid_attached_file :documents
  
  belongs_to :user
  
  field :title, :type => String
  field :body, :type => String, :default => ""
  slug :title, history: true
    
  field :published, type: Boolean, :default => true

  rails_admin do
    list do
      field :title
      field :user
      field :published
      exclude_fields :created_at, :updated_at, :updated_by, :created_by, :body, :_id, :_slugs
    end
    edit do
      field :title
      field :body, :rich_editor
      field :user do
        default_value do
          bindings[:view]._current_user.id
        end
      end
      field :published
      field :_slugs
      field :pictures
      field :documents
    end
  end
end
