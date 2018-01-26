class Order < ApplicationRecord
    belongs_to :user
    has_many :comments, inverse_of: :order 
    accepts_nested_attributes_for :comments
end
#https://ixn.es/Ruby%20on%20Rails%20For%20Dummies.pdf
#http://patshaughnessy.net/2014/6/16/a-rule-of-thumb-for-strong-parameters