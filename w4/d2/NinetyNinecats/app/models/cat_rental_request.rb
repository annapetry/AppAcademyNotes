class CatRentalRequest < ActiveRecord::Base
  after_initialize :set_status # alt: -> { self.status ||= "PENDING" }
  
  belongs_to(
    :cat,
    class_name: "Cat",
    foreign_key: :cat_id,
    primary_key: :id
  )
  
  STATUS = %w[PENDING APPROVED DENIED]
  
  validates :cat_id, :start_date, :end_date, presence: true
  validates :status, inclusion: { in: STATUS }
  validate :overlapping_approved_requests
  
  def approve!
    self.transaction do
      self.status = "APPROVED"
      self.save!
      self.overlapping_requests.each do |request|
        request.status = "DENIED"
        request.save!
      end
    end
  end
  
  def deny!
    self.status = "DENIED"
    self.save!
  end
  
  def pending?
    self.status == "PENDING"
  end
  
  def overlapping_requests
    # look for rentals where a start date falls between another start/end date
    other_request_dates = "cat_rental_requests.start_date AND cat_rental_requests.end_date"
    
    self.class
      .where("cat_rental_requests.cat_id = ?", self.cat_id)
      .where(<<-WHERE, self.start_date, self.end_date, self.start_date, self.end_date)
        ? BETWEEN #{other_request_dates}
        OR
        ? BETWEEN #{other_request_dates}
        OR
        (cat_rental_requests.start_date > ?
        AND
        cat_rental_requests.end_date < ?)
      WHERE
      .where("cat_rental_requests.id != ?", self.id)
  end
  
  def overlapping_approved_requests
    return if self.status == "DENIED"
    overlapping = overlapping_requests.any? do |rental_request|
      rental_request.status == "APPROVED"
    end
    errors[:start_date] << "Cannot rent a rented cat" if overlapping
    
    overlapping
  end
  
  def set_status # not necessary, see top comment for single line implementation
    self.status ||= "PENDING"
  end
end
