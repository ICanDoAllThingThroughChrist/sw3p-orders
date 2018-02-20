class Site < ApplicationRecord #Class Survey
    #belongs_to :user
    has_many :orders, :dependent => :destroy#so that when we delete a site(survey) all of its orders(questions) are deleted too
    accepts_nested_attributes_for :orders
    has_many :sitetasks
    has_many :tasks, through: :sitetasks
    #http://api.rubyonrails.org/classes/ActiveRecord/Scoping/Named/ClassMethods.html
    accepts_nested_attributes_for :tasks
    def self.ne 
        where(name: 'NE')
    end
    def self.se 
        where(name: 'SE')
    end 
    def self.nw 
        where(name: 'NW')
    end 
    def self.sw 
        where(name: "SW")
    end 
    def self.filter_by_task(task_ids)  
        Site.select{|site| (task_ids - site.task_ids).empty?}
    end
    
    def tasks_attributes=(task_attributes)
        binding.pry
        task_attributes.each do |key, value|
            if !value[:name].empty?
                if new_task = Task.find_by(name: value[:name])
                    self.tasks << new_task 
                else
                    self.tasks.build(name: value[:name])
                end 
            end 
        end
    end 

    def add_task(task_id)
    sitetask = self.sitetasks.find_by(task_id: task_id)
    if sitetask.blank?
        task = Task.find_by(id: task_id)
        task.sitetasks.build(quantity: 1, site: self)
        else sitetask
        sitetask.quantity += 1
        sitetask
        end
    end
end
#http://api.rubyonrails.org/v5.0/classes/ActiveRecord/Relation.html
#http://www.mitchcrowe.com/10-most-underused-activerecord-relation-methods/
# class Survey|Site < ActiveRecord::Base
#     has_many :questions|:tasks
#     accepts_nested_attributes_for :questions|:tasks
# end

