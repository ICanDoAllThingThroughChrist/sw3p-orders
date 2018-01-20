class Task < ApplicationRecord
    has_many :orders
    has_many :site, through: :orders 
    belongs_to :user
    def self.by_user(user_id)
        where(user: user_id)
    end
    def self.from_today
        where("created_at >=?", Time.zone.today.beginning_of_day)
    end
       
    def self.old_news
        where("created_at <?", Time.zone.today.beginning_of_day)
    end
end

