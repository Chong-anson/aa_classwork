class ArtworkShare < ApplicationRecord
  validates :artwork_id, :view_id, presence: true
  validates :artwork_id, uniqueness: { scope: :view_id, message: "Cannot be shared more than once!"}
  
  belongs_to :artwork,
    foreign_key: :artwork_id,
    class_name: :Artwork

  belongs_to :shared_viewers,
    foreign_key: :view_id,
    class_name: :User

end
