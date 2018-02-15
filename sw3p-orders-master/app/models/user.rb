class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  #belongs_to :current_order, class_name: 'Order', foreign_key: 'order_id' #failed to allow sessions#new when this is included
  has_many :orders
  #has_many :user_sites
  #has_many :sites, through: :user_sites
  #belongs_to :task
  # has_many :tasks, through: :sitetasks
  #accepts_nested_attributes_for :task
  # accepts_nested_attributes_for :task
  # belongs_to :current_site, class_name: 'Site', foreign_key: 'site_id'

end
#http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html


# create_table "users", force: :cascade do |t|
#   t.string "name"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.string "email"
#   t.string "password_digest"
#   t.string "password_confirmation"
#   t.boolean "admin", default: false
#   t.string "uid"
#   t.string "image"
#   t.index ["email"], name: "index_users_on_email", unique: true
# end