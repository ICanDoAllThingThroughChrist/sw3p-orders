class order_attachments < ApplicationRecord
    belongs_to :order
    belongs_to :attachment
end