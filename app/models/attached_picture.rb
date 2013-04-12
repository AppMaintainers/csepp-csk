class AttachedPicture
  include Mongoid::Document
  include Mongoid::Paperclip

  belongs_to :page
  belongs_to :blog_post

  has_mongoid_attached_file :pictures, styles: { big: "1000x1000>", medium: "300x300>", thumb: "100x100>" }

  rails_admin do
    visible false
    list do
    end
    edit do
      field :pictures
    end
  end
end
