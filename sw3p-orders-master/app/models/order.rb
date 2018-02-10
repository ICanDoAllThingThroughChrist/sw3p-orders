class Order < ApplicationRecord
    belongs_to :user
    belongs_to :site
    #belongs_to :task 
    #belongs_to :frequencie 
    #belongs_to :deadline 
    #belongs_to :statuse
    # has_many :order_tasks
    # has_many :tasks, through: :order_tasks#, :inverse_of => :order
    # accepts_nested_attributes_for :tasks
    # has_many :order_frequencies
    # has_many :frequencies, through: :order_frequencies#, :inverse_of => :order
    # accepts_nested_attributes_for :frequencies
    # has_many :order_deadlines
    # has_many :deadlines, through: :order_deadlines#, :inverse_of => :order
    # accepts_nested_attributes_for :deadlines
    # has_many :order_statuses
    # has_many :statuses, through: :order_statuses#, :inverse_of => :order
    # accepts_nested_attributes_for :statuses
    has_and_belongs_to_many :comments
    #has_one :task, inverse_of: :order
    accepts_nested_attributes_for :comments#, allow_destroy: true
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
        comment_attributes.each do |key, value|#key, value hash during Create Order, BUT fails for comment_attributes is a string during update
        #binding.pry
        if value[:comment] == nil
            new_comment = Comment.create(comment: 'a comment')
            binding.pry #http://www.xyzpub.com/en/ruby-on-rails/3.2/activerecord_datensatz_veraendern.html
            self.comments << new_comment
        else 
            if !value[:comment].empty?
                if new_comment = Comment.find_by(comment: value[:comment])
                    binding.pry
                    self.comments << new_comment 
                    binding.pry
                else
                    self.comments.build(comment: value[:comment])
                end 
            end 
        end
        end
    end 
end
#https://ixn.es/Ruby%20on%20Rails%20For%20Dummies.pdf
#http://patshaughnessy.net/2014/6/16/a-rule-of-thumb-for-strong-parameters