class Menu
  include Mongoid::Document
  include Mongoid::Userstamp

  belongs_to :content

  field :name, :type => String
  field :url, :type => String
  field :order, :type => Integer

  validates :name, presence: true
  validates :url, presence: true

  rails_admin do
    list do
      field :content
      field :name
      field :url
      field :order
    end
    edit do
      field :content
      field :name
      field :url
      field :order
    end
  end
end
