class Owner < ActiveRecord::Base
  belongs_to :text
  belongs_to :image
  belongs_to :user
end
