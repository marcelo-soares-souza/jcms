class Menu < ActiveRecord::Base
  attr_accessible :title, :url

  validates :title, :presence => true,
                    :length => { :minimum => 4, :maximum => 254 }
  validates :url,   :presence => true,
                    :length => { :minimum => 4, :maximum => 254 }

end
