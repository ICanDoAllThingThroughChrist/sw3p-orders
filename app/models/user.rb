class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  #has_many :orders
  #has_many :site, through: :sitetasks
  #has_many :task
  #accepts_nested_attributes_for :task
  # accepts_nested_attributes_for :task
end
#http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html

# class Participant|User < ActiveRecord::Base
#   has_many :answers|:orders
#   has_many :questions, through: :answers|:orders
# end