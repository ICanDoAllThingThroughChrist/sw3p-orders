class Frequency < ApplicationRecord
    belongs_to :orders, :inverse_of => :frequencies
end

