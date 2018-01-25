class Order < ApplicationRecord
    belongs_to :user
    has_many :sites
    has_many :tasks
end
#https://ixn.es/Ruby%20on%20Rails%20For%20Dummies.pdf