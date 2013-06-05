class AttachedPicture
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :page
  belongs_to :blog_post

  mount_uploader :picture, PictureUploader

  rails_admin do
    visible false
    list do
    end
    edit do
      field :picture
    end
  end
end
