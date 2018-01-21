class Site < ApplicationRecord
    has_many :sitetasks
    has_many :task, through: :sitetasks
    accepts_nested_attributes_for :task
    def task_attributes=(task_attributes)
        binding.pry
        task_attributes.each do |key, value|
            if !value[:name].empty?
                if new_task = Task.find_by(name: value[:name])
                    self.task << new_task 
                else
                    self.task.build(name: value[:name])
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

# class Survey|Site < ActiveRecord::Base
#     has_many :questions|:tasks
#     accepts_nested_attributes_for :questions|:tasks
# end

