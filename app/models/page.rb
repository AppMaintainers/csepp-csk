class Page < Content

  has_many :attached_pictures
  has_many :attached_documents
  accepts_nested_attributes_for :attached_pictures
  accepts_nested_attributes_for :attached_documents

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
      #field :position
      #field :user do
      #  default_value do
      #    bindings[:view]._current_user.id
      #  end
      #end
      #field :published
      field :attached_documents
      field :attached_pictures
      #field :_slugs
      #field :pictures
      #field :documents
    end
  end
end
