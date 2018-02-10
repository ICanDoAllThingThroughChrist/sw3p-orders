class OrderFrequency < ApplicationRecord
    belongs_to :order
    belongs_to :frequency
end