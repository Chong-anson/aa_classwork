class Collection < ApplicationRecord

  belongs_to :user,
    foreign_key: :user_id, 
    class_name: :User 

  has_many :collection_records, 
    foreign_key: :collection_id, 
    class_name: :CollectionRecord 
  
  has_many :artworks, 
    through: :collection_records, 
    source: :artwork
end
