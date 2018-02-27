class Order < ApplicationRecord #Class Survey
    #before_save :save_comment_names
    #attr_accessor :comment_names
    #attr_writer :comment_names
    attr_accessor :attachment
    belongs_to :user
    belongs_to :site#
    has_many :ordercomments
    has_many :comments, through: :ordercomments #questions
    scope :task1, -> {where(name: 'task1')}
    scope :task1, -> {where(name: 'task2')}
    accepts_nested_attributes_for :comments, allow_destroy: true
    has_many :attachments, dependent: :destroy
    accepts_nested_attributes_for :attachments, reject_if: :all_blank
    mount_uploader :attachment, AttachmentUploader
    def self.task1
        where(name: 'task1')
    end
    
    def self.task2
        where(name: 'task2')
    end
        
    # def save_comment_names
    #     if @comment_names 
    #         binding.pry
    #         self.comments = @comment_names.split.map { |comment| Comment.where(comment: comment).first_or_create!}
    #     end
    # end  
    # def comment_names 
    #     @comment_names || comments.pluck(:comment).join(' ')
    # end 
    def self.by_author(user_id)
        where(user:user_id) 
    end
    def comments_attributes=(comment_attributes)
        #binding.pry
        comment_attributes.each do |index, value|
            #binding.pry
            if value[:comment] == nil 
                new_comment = Comment.create(comment: 'a comment')
                self.comments << new_comment 
            else 
               if !value[:comment].empty?
                        binding.pry
                        new_comment = Comment.create(comment: value[:comment])
                        self.comments << new_comment
                        binding.pry
                        a= []
                        self.comments.each {|comment| a << "#{comment.comment}"}
                        b= a.join( )
                        self.comments << Comment.create(comment: b) 
                        binding.pry
               end
           end 
        end
    end 
    # def create_comment
    #     self.comment = Comment.create(name: new_comment) if new_comment.present?
    # end
    # def comment_names 
    #     @comment_names || comments.pluck(:name).join(' ')
    #     #binding.pry
    # end
    # def save_comment_names
    #     if @comment_names 
    #         self.comments = @comment_names.split.map {|name| Comment.where(name: name).first_or_create! }
    #     end
    # end
end