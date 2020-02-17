class CatRentalRequest < ApplicationRecord
  STATUS = %w(PENDING APPROVED DENIED)
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: {in: STATUS, message:"%{value} is not an option"} 
  validate :overlapping_request

  belongs_to :cat

  def overlapping_request 
    # rental = CatRentalRequest.where(cat_id: self.cat_id).
    rental = CatRentalRequest.where(cat_id: self.cat_id).where('? <= end_date AND ? >= start_date', self.start_date, self.end_date).where(status: "APPROVED")
    errors[:cat_id] << "Already rented" unless rental.empty?
  end
  
  def overlapping_pending_request
    CatRentalRequest.where(cat_id: self.cat_id).where('? <= end_date AND ? >= start_date', self.start_date, self.end_date).where(status: "PENDING")
  end

  def approve!
    self.update(status: "APPROVED")

    other_reqs = overlapping_pending_request
    debugger
    other_reqs.each do |req|
      req.deny!
    end
  end

  def deny!
    self.update(status: "DENIED")
  end
end