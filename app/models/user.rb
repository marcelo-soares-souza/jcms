class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :firstname, :lastname, :email, :password, :password_confirmation, :remember_me, :status

  validates :firstname,   :presence => true
  validates :lastname,   :presence => true

  has_many :contents, :dependent => :destroy
  has_many :texts, :through => :contents
  has_many :images, :through => :contents
end
