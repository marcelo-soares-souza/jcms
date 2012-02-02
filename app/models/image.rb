class Image < ActiveRecord::Base
  belongs_to :license

  validates :title, :presence => true
  validates :abstract, :presence => true

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "150x150>" }

  has_many :contents, :dependent => :destroy
  has_many :users, :through => :contents
end
