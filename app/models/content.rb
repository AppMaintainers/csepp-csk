class Content
  include Mongoid::Document
  include Mongoid::Slug
  include Mongoid::Userstamp

  has_one :menu

  field :title, type: String
  field :body, type: String, default: ""
  slug :title, history: true

  validates :title, presence: true
  validates :body, presence: true

  rails_admin do
    list do
      field :title
      exclude_fields :created_at, :updated_at, :updated_by, :created_by, :body, :_id, :_slugs
    end
    edit do
      field :title
      field :body, :rich_editor
      field :_slugs
    end
  end


end
