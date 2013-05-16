class BlogPost
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Slug

  has_many :attached_pictures
  has_many :attached_documents
  accepts_nested_attributes_for :attached_pictures
  accepts_nested_attributes_for :attached_documents

  field :title, type: String, default: ""
  field :body, type: String, default: ""
  field :updated_at, type: Time, default: lambda{ Time.now }
  field :created_at, type: Time, default: lambda{ Time.now }

  slug :title, history: true

  validates :title, presence: true, :length => { :minimum => 3 }
  validates :body, presence: true

  default_scope order_by('updated_at DESC')

  rails_admin do
    list do
      field :title
      exclude_fields :created_at, :updated_at, :body, :_id, :_slugs
    end
    edit do
      field :title
      field :body #, :rich_editor
      field :_slugs
      field :attached_documents
      field :attached_pictures
    end
  end

end
