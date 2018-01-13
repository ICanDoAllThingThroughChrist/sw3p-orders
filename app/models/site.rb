class Site < ApplicationRecord
    has_many :orders
    has_many :task, through: :orders

    accepts_nested_attributes_for :task
    def task_attributes=(task_attributes)
        binding.pry
        task_attributes.each do |key, value|
            if !value[:name].empty?
                if new_item = Task.find_by(name: value[:name])
                    self.task << new_item 
                else
                    self.task.build(name: value[:name])
                end 
            end 
        end
    end 
end
