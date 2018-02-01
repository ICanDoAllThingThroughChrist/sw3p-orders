class Ordercomment < ApplicationRecord
    belongs_to :order
    belongs_to :comment
end