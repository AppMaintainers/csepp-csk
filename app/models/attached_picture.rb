class AttachedPicture

  include Mongoid::Document
  include Mongoid::Paperclip

  #embedded_in :content, inverse_of: attached_files
  belongs_to :page
  belongs_to :blog

  has_mongoid_attached_file :pictures

  rails_admin do
    list do
    end
    edit do
      field :pictures
    end
  end

end
