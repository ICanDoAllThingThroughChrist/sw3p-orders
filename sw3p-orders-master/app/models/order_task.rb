class OrderTask < ApplicationRecord
    belongs_to :order
    belongs_to :task
end