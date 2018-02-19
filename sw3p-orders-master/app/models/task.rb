class Task < ApplicationRecord
    #has_many :orders
    #belongs_to :user
    #belongs_to :order
    #belongs_to :site
    #belongs_to :user
    has_many :sitetasks
    has_many :sites, through: :sitetasks
    accepts_nested_attributes_for :sites
    scope :in_progress, -> {where(task_status: 'in_progress')}
    scope :december_2018, -> {where(deadline: 'December 2018')}
    scope :june_2018, -> {where(deadline: 'June 2018')}
    scope :by_user, -> {where(user: user_id)}
    def self.by_user(user_id)
        where(user: user_id)
    end
    # def self.from_today
    #     where('created_at >= :beginning_of_day',
    #     )
    # end
       
    # def self.old_news
    #     where('created_at < :beginning_of_day',
    #     :beginning_of_day  => Time.zone.today)
    # end
    
    def self.in_progress
        where(task_status: 'in_progress')
    end

    def self.december_2018
        where(deadline: 'December 2018')
    end

    def self.june_2018
        where(deadline: 'June 2018')
    end

    def self.deadline
        pluck(:deadline)
    end

end

