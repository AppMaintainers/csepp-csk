class Menu
  include Mongoid::Document
  include Mongoid::Userstamp
  include Mongoid::Tree
  include Mongoid::Tree::Ordering

  belongs_to :content

  field :name, :type => String
  field :url, :type => String
  #field :order, :type => Integer

  validates :name, presence: true, if: "content_id.nil?"
  validates :url, presence: true, if: "content_id.nil?"

  #scope :belongs_to_page, where('content_id is NOT NULL')

  #scope :ordered, order_by(order: :asc)
  #scope :ordered, order_by('order ASC')

  before_save :set_name_and_url

  def set_name_and_url
    self.name = content.title if name.blank?
    self.url = Rails.application.routes.url_helpers.root_url + content.slug if url.blank?
  end

  def self.belongs_to_page
    self.all.to_a.select{ |menu| !menu.content.nil? && menu.content._type == "Page"}
  end

  def self.other_links
    self.all.to_a.select{ |menu| menu.content.nil? }
  end

  def self.has_blog?
    self.all.to_a.any?{ |menu| !menu.content.nil? && menu.content._type == "BlogPost"}
  end

  rails_admin do
    list do
      field :content
      field :name
      field :url
      field :parent
      field :position
      #field :order
    end
    edit do
      field :content
      field :name
      field :url
      field :parent
      field :position
      #field :order
    end
  end
end
