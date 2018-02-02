class Order < ApplicationRecord
    belongs_to :user
    belongs_to :site
    has_many :comments, inverse_of: :order 
    #has_one :task, inverse_of: :order
    accepts_nested_attributes_for :comments
    #has_many :tasks, inverse_of: :order
    #accepts_nested_attributes_for :tasks 
    def self.by_author(user_id)
        where(user:user_id) 
    end
    # def tasks_attributes=(task_attributes)
    #     binding.pry
    #     task_attributes.each do |key, value|
    #         if !value[:name].empty?
    #             if new_task = Task.find_by(name: value[:name])
    #                 self.taskcomms << new_task 
    #             else
    #                 self.tasks.build(name: value[:name])
    #             end 
    #         end 
    #     end
    # end 
    def comments_attributes=(comment_attributes)
        binding.pry
        comment_attributes.each do |key, value|#key, value hash during Create Order, BUT fails for comment_attributes is a string
        binding.pry
            if !value[:comment].empty?
                if new_comment = Comment.find_by(comment: value[:comment])
                    self.comments << new_comment 
                else
                    self.comments.build(comment: value[:comment])
                end 
            end 
        end
    end 
end
#https://ixn.es/Ruby%20on%20Rails%20For%20Dummies.pdf
#http://patshaughnessy.net/2014/6/16/a-rule-of-thumb-for-strong-parameters