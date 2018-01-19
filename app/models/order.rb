class Order < ApplicationRecord
    belongs_to :task
    belongs_to :site
end

# class Answer|Order < ActiveRecord::Base
#     belongs_to :participant|:user
#     belongs_to :question|:task
# end