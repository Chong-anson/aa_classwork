# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  yr         :integer          not null
#  album_type :string           default("true"), not null
#  band_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
    
    validates :title, :yr, :band_id, :album_type, presence: true 
    # validates :title, uniqueness: {scope: :band_id, message: "Duplicate albums!"}
    # validates :album_type, inclusion: [:live, :studio]

    belongs_to :band, 
        foreign_key: :band_id, 
        class_name: :Band 
end
