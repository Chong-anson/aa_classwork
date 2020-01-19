class ShortenedUrl < ApplicationRecord
  validates :long_url, :short_url, :user_id, presence: true


  def self.random_code
    random_short_url = SecureRandom::urlsafe_base64
    while ShortenedUrl.exists?(short_url: random_short_url)
      random_short_url = SecureRandom::urlsafe_base64
    end
    random_short_url
  end

  def self.create!(user, long_url)
    result = ShortenedUrl.random_code
    ShortenedUrl.create(short_url: result, long_url: long_url, user_id: user.id)
  end

  def num_clicks
    self.visits.count
  end

  def num_uniques
    # visited_user = Hash.new(false)
    # count = 0 
    # self.visits.each do |visitor| 
    #   count += 1 unless visited_user[visitor.user_id]
    #   visited_user[visitor.user_id] = true
    # end
    # count
    vistors = Visit.select(:user_id).uniq.count
  end

  belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :visits,
    primary_key: :id,
    foreign_key: :url_id,
    class_name: :Visit 

  has_many :visitors, 
    through: :visits,
    source: :visitor
end
