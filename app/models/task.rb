class Task < ApplicationRecord
    belongs_to :sites
    has_many :orders
    has_many :users, through: :orders
    accepts_nested_attributes_for :orders    
end

# class Question|Task < ActiveRecord::Base
#     belongs_to :survey|:site
#     has_many :answers|:orders
#     has_many :participants|:users, through: :answers|:orders
#     accepts_nested_attributes_for :answers|:orders
#   end
