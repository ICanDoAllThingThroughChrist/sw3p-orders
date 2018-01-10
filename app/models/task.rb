class Task < ApplicationRecord
    has_many :orders
    has_many :sites through :orders

    accepts_nested_attributes_for :sites 
end
