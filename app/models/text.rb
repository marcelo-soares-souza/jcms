class Text < ActiveRecord::Base
  belongs_to :license

  validates :title, :presence => true,
                    :length => { :minimum => 5, :maximum => 254 }

  validates :abstract, :presence => true,
                       :length => { :minimum => 10, :maximum => 254 }

  validates :body, :presence => true

  has_many :contents, :dependent => :destroy
  has_many :users, :through => :contents

  accepts_nested_attributes_for :contents, :allow_destroy => :true, :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end
