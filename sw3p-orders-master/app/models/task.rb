class Task < ApplicationRecord
    belongs_to :orders, :inverse_of => :tasks
    has_many :sitetasks
    has_many :sites, through: :sitetasks 
    #belongs_to :user
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

