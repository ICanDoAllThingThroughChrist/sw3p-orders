class Frequencie < ApplicationRecord
    belongs_to :order, :inverse_of => :frequencie
end

