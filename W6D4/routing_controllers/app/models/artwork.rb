class Artwork < ApplicationRecord
  validates :title, uniqueness: { scope: :artist_id, message: "Title must be unique! "}
  validates :artist_id, :image_url, :title, presence: true 

  belongs_to :artist, 
    foreign_key: :artist_id, 
    class_name: :User 

  has_many :shares, 
    foreign_key: :artwork_id,
    class_name: :ArtworkShare,
    dependent: :destroy

  has_many :comments, 
    foreign_key: :artwork_id, 
    class_name: :Comment,
    dependent: :destroy

  has_many :collection_records, 
    foreign_key: :artwork_id, 
    class_name: :CollectionRecord
  
  has_many :collections, 
    through: :collection_records,
    source: :collection
  has_many :likes, as: :liked 
end
