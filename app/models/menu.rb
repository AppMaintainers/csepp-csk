class Menu
  include Mongoid::Document
  include Mongoid::Userstamp

  field :url, :type => String
  field :order, :type => Integer

  rails_admin do
    list do
      field :url
      field :order
    end
    edit do
      field :url
      field :order
    end
  end
end
