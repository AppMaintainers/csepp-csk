class Content
  include Mongoid::Document
  include Mongoid::Slug
  include Mongoid::Userstamp

  field :title, :type => String
  field :body, :type => String, :default => ""
  slug :title, history: true

  validates :title, presence: true
  validates :body, presence: true

  #field :published, type: Boolean, :default => true

  rails_admin do
    list do
      field :title
      #field :user
      #field :published
      exclude_fields :created_at, :updated_at, :updated_by, :created_by, :body, :_id, :_slugs
    end
    edit do
      field :title
      field :body, :rich_editor
      #field :user do
      #  default_value do
      #    bindings[:view]._current_user.id
      #  end
      #end
      #field :published
      field :_slugs
      #field :pictures
      #field :documents
    end
  end


end
