class Task < ApplicationRecord
    #has_many :orders
    #belongs_to :user
    #belongs_to :order
    #belongs_to :site
    #belongs_to :user
    has_many :sitetasks
    has_many :sites, through: :sitetasks

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

