class Status < ApplicationRecord
    belongs_to :orders,:inverse_of => :statuses
end

