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
        binding.pry
        comment_attributes.each do |key, value|#key, value hash during Create Order, BUT fails for comment_attributes is a string during update
        binding.pry
            if value[:comment] == nil
                new_comment = Comment.create(comment: 'a comment')
                binding.pry #http://www.xyzpub.com/en/ruby-on-rails/3.2/activerecord_datensatz_veraendern.html
                self.comments << new_comment
            else 
                if !value[:comment].empty?
                    if new_comment = Comment.find_by(comment: value[:comment])
                        binding.pry
                        self.comments << new_comment 
                    else
                        self.comments.build(comment: value[:comment])
                    end 
                end 
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