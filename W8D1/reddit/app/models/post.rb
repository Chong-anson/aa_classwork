class Post < ApplicationRecord
    validates :title, presence: true

    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User
    
    has_many :postsubs,
        foreign_key: :post_id,
        class_name: :PostSub,
        inverse_of: :post

    has_many :subs,
        through: :postsubs,
        source: :sub

    has_many :comments,
        foreign_key: :post_id, 
        class_name: :Comment

    def comments_by_parent_id 
        hash = Hash.new { |h,k| h[k] = [] }

        self.comments.each do | comment | 
            hash[comment.parent_comment_id] << comment
        end 
        hash
    end
end
