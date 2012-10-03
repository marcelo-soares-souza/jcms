class Owner < ActiveRecord::Base
  belongs_to :text
  belongs_to :image
  belongs_to :user

  # validates_uniqueness_of :id, :scope => [:text_id, :user_id]
  # validates_uniqueness_of :user_id, :scope => :text_id
  # validates_uniqueness_of :text_id, :scope => :user_id
end
