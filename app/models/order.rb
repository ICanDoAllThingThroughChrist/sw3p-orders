class Order < ApplicationRecord
    belongs_to :user
    has_many :comments, inverse_of: :order 
    #has_one :task, inverse_of: :order
    accepts_nested_attributes_for :comments
    # has_many :tasks, inverse_of: :order
    # accepts_nested_attributes_for :tasks 
    def self.by_author(user_id)
        where(user:user_id) 
    end

end
#https://ixn.es/Ruby%20on%20Rails%20For%20Dummies.pdf
#http://patshaughnessy.net/2014/6/16/a-rule-of-thumb-for-strong-parameters