class Image < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, :use => :slugged

  validates :title,    :presence => true,
                       :length => { :minimum => 5, :maximum => 254 }
  validates :abstract, :presence => true,
                       :length => { :minimum => 10, :maximum => 254 }

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "150x150>" }

  belongs_to :license

  has_many :contents, :dependent => :destroy
  has_many :users,    :through => :contents

  accepts_nested_attributes_for :contents, :allow_destroy => :true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
