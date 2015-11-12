class Setting
  include Mongoid::Document

  field :title, type: String, default: ""
  field :subtitle, type: String, default: ""
  field :background, type: String, default: ""
  field :header_background, type: String, default: ""
  field :header_font, type: String, default: ""
  field :blogname, type: String, default: ""

  rails_admin do
    create
  end
end
