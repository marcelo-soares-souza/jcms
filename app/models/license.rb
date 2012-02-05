class License < ActiveRecord::Base
  belongs_to :text
  belongs_to :image

  validates_uniqueness_of :name

  validates :name,        :presence => true
  validates :description, :presence => true
  validates :url,         :presence => true
end
