class OrderStatuse < ApplicationRecord
    belongs_to :order
    belongs_to :statuse
end