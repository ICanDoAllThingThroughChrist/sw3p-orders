class Comment < ApplicationRecord
    belongs_to :order, :inverse_of => :comments
end