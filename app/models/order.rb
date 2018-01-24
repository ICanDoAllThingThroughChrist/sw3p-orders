class Order < ApplicationRecord
    belongs_to :user
    has_many :sites
    has_many :tasks
end
