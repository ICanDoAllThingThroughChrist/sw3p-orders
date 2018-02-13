class CommentOrder < ApplicationRecord
    belongs_to :order
    belongs_to :comment
end