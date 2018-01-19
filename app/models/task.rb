class Task < ApplicationRecord
    has_many :orders
    has_many :site, through: :orders
    #has_many :users
    # accepts_nested_attributes_for :sites  
end

# class Question|Task < ActiveRecord::Base
#     belongs_to :survey|:site
#     has_many :answers|:orders
#     has_many :participants|:users, through: :answers|:orders
#     accepts_nested_attributes_for :answers|:orders
#   end
