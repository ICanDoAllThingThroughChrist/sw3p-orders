class Site < ApplicationRecord
    has_many :orders
    has_many :tasks, through: :orders

    accepts_nested_attributes_for :tasks 
    def task=(task)
        #binding.pry
        task.each do |item|
            if !item[:name].empty?
                if new_item = Task.find_by(name: item[:name])
                    self.tasks << new_item 
                else
                    self.tasks.build(name: item[:name])
                end 
            end 
        end
    end 
end
