class User < ActiveRecord::Base
  has_secure_password
  has_many :pictures
  validates_uniqueness_of :user_name
  validates_presence_of :name
  validates_presence_of :user_name


end
