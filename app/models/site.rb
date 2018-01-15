class Site < ApplicationRecord
    has_many :orders, dependent: :destroy
    has_many :task, through: :orders
    belongs_to :user

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

    def add_task(task_id)
    order = self.orders.find_by(task_id: task_id)
    if order.blank?
        task = Task.find_by(id: task_id)
        task.orders.build(quantity: 1, site: self)
        else order
        order.quantity += 1
        order
        end
    end
end