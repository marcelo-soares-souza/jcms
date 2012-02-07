class Text < ActiveRecord::Base
  searchable do
    text :title, :body, :abstract
    time :created_at
  end

  paginates_per 20

  extend FriendlyId
  friendly_id :title, :use => :slugged

  validates :title,    :presence => true,
                       :length => { :minimum => 5, :maximum => 254 }
  validates :abstract, :presence => true,
                       :length => { :minimum => 10, :maximum => 254 }

  validates :body, :presence => true

  belongs_to :license

  has_many :owners, :dependent => :destroy
  has_many :users,    :through => :owners

  accepts_nested_attributes_for :owners, :allow_destroy => :true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
