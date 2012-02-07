class User < ActiveRecord::Base
#  devise :database_authenticatable, :registerable,
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  attr_accessible :firstname, :lastname, :email, :password, :password_confirmation, :remember_me, :status

  validates :firstname,   :presence => true
  validates :lastname,   :presence => true

  has_many :owners, :dependent => :destroy
  has_many :texts,    :through => :owners
  has_many :images,   :through => :owners
end
