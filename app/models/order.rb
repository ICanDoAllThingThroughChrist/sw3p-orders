class Order < ApplicationRecord
    belongs_to :site
    belongs_to :task
    belongs_to :user
end
