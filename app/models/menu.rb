class Menu < ActiveRecord::Base
  attr_accessible :title, :url

  validates_uniqueness_of :title

  validates :title, :presence => true,
                    :length => { :minimum => 4, :maximum => 64 }

  validates :url,   :presence => true,
                    :length => { :minimum => 4, :maximum => 254 }
end
