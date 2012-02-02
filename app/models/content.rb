class Content < ActiveRecord::Base
  belongs_to :user
  belongs_to :text
  belongs_to :image
end
