class Order < ApplicationRecord
    has_many :site
    has_many :task
end
