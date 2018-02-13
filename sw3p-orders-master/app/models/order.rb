class Order < ApplicationRecord #Class Survey
    before_save :create_comment, :save_comment_names
    attr_accessor :new_comment, :comment_names
    attr_writer :comment_names
    belongs_to :user
    belongs_to :site#
    has_many :ordercomments
    has_many :comments, through: :ordercomments #questions
    accepts_nested_attributes_for :comments, allow_destroy: true

    def self.by_author(user_id)
        where(user:user_id) 
    end
    def comments_attributes=(comment_attributes)
        comments_array = []
        comments_array << Comment.all
        binding.pry
        comment_attributes.each do |key, value|#key, value hash during Create Order, BUT fails for comment_attributes is a string during update
            binding.pry   
            if value[:comment].empty?
             new_comment == 'nil'
             comments_attributes << new_comment 
            else 
             new_comment = Comment.find_by(id: value[:comment]) 
             comments_attributes << new_comment
            binding.pry
            end 
        end     
    end 
    def create_comment
        self.comment = Comment.create(name: new_comment) if new_comment.present?
    end
    def comment_names 
        @comment_names || comments.pluck(:name).join(' ')
        #binding.pry
    end
    def save_comment_names
        if @comment_names 
            self.comments = @comment_names.split.map {|name| Comment.where(name: name).first_or_create! }
        end
    end
end