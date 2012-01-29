class Image < ActiveRecord::Base
  belongs_to :license

  validates :title, :presence => true
  validates :abstract, :presence => true

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "150x150>" }
#  attr_accessor :image_file_name
#  attr_accessor :image_content_type
#  attr_accessor :image_file_size
#  attr_accessor :image_updated_at
end
