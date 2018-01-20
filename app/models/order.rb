class Order < ApplicationRecord
    belongs_to :task
    belongs_to :site
end
