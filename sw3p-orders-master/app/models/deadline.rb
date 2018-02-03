class Deadline < ApplicationRecord
    belongs_to :order, :inverse_of => :deadline
end

