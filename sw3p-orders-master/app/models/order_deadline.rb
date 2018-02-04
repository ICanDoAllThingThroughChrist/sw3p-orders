class OrderDeadline < ApplicationRecord
    belongs_to :order
    belongs_to :deadline
end