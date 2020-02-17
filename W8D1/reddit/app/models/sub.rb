class Sub < ApplicationRecord
    # before_action :required_logged_in 
    validates :title, :description, presence: true 

    belongs_to :moderator, 
        foreign_key: :moderator_id, 
        class_name: :User

    has_many :postsubs,
        foreign_key: :sub_id,
        class_name: :PostSub,
        inverse_of: :sub

    has_many :posts,
        through: :postsubs,
        source: :post
    end
