class OrderComment < ApplicationRecord
    belongs_to :order
    belongs_to :comment
end