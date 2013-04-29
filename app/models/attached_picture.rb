class AttachedPicture
  include Mongoid::Document
  include Mongoid::Paperclip

  belongs_to :page
  belongs_to :blog_post

  has_mongoid_attached_file :picture, styles: { big: "1000x1000>", medium: "300x300>", thumb: "140x140#" }

  rails_admin do
    visible false
    list do
    end
    edit do
      field :picture
    end
  end
end
