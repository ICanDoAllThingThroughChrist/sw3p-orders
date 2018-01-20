class Task < ApplicationRecord
    has_many :orders
    has_many :site, through: :orders 
    belongs_to :user
end

