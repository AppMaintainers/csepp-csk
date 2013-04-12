class BlogPost < Content
  has_many :attached_pictures
  has_many :attached_documents
  accepts_nested_attributes_for :attached_pictures
  accepts_nested_attributes_for :attached_documents

  default_scope order_by('updated_at DESC')

  rails_admin do
    list do
      field :title
      exclude_fields :created_at, :updated_at, :updated_by, :created_by, :body, :_id, :_slugs
    end
    edit do
      field :title
      field :body, :rich_editor
      field :attached_documents
      field :attached_pictures
    end
  end

end
