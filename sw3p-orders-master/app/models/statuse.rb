class Statuse < ApplicationRecord
    belongs_to :order,:inverse_of => :statuse
end

