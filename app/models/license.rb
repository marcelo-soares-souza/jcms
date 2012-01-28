class License < ActiveRecord::Base
  has_many :texts, :dependent => :destroy

  validates :name, :presence => true
  validates :description, :presence => true
  validates :url, :presence => true
end
