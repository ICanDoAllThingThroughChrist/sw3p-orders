class Deadline < ApplicationRecord
    belongs_to :orders, :inverse_of => :deadlines
end

