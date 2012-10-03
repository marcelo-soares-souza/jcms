class Text < ActiveRecord::Base
  searchable do
    text :title, :body, :abstract
    time :created_at
  end

  paginates_per 20

  extend FriendlyId
  friendly_id :title, :use => :slugged

  validates :title,    :presence => true,
                       :length => { :minimum => 4, :maximum => 254 }

  validates :abstract, :presence => true,
                       :length => { :minimum => 8, :maximum => 254 }

  validates :body, :presence => true

  belongs_to :license

  has_many :owners, :dependent => :destroy, :uniq => true
  has_many :users,  :through   => :owners, :uniq => true

  validates_uniqueness_of :title, :case_sensitive => true, :message => I18n.t('has already been used')

  accepts_nested_attributes_for :owners,
                                :allow_destroy => :true,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }


end
