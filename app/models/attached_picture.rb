class AttachedPicture
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :page
  belongs_to :blog_post

  mount_uploader :picture, PictureUploader

  after_save do
    destroy if picture.blank?
  end

  rails_admin do
    visible false
    list do
    end
    edit do
      field :picture
    end
  end
end
