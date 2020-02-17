class Cat < ApplicationRecord
  COLOR = %w(white black brown)
  validates :birth_date, :color, :name, :sex, :description, presence: true 
  validates :color, inclusion: {in: COLOR, message: "%{value} is not a valid color"}
  validates :sex, length: {maximum: 1}, inclusion: {in: %w(M F), message: "Sex can only be either M or F"}

  has_many :cat_rental_requests,
    dependent: :destroy

  def age 
    Date.today.year - self.birth_date.year
  end
end

# a = Cat.new(birth_date: "2011/01/02", color: "white", name: "abc", sex: "M", description: "asdlkjf")


# crr1 = CatRentalRequest.new(cat_id: 1, start_date: Date.new(2020, 01,01), end_date: Date.new(2020, 03, 01), status: 'PENDING')
