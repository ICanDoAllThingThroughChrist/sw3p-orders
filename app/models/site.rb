class Site < ApplicationRecord
    has_many :orders
    has_many :tasks, through: :orders

    accepts_nested_attributes_for :tasks 
end
