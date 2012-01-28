class Text < ActiveRecord::Base
  belongs_to :license

  validates :title, :presence => true
  validates :abstract, :presence => true
  validates :body, :presence => true
end
