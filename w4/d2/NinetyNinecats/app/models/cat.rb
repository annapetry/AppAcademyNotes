class Cat < ActiveRecord::Base
  has_many(
    :rental_requests,
    class_name: "CatRentalRequest",
    foreign_key: :cat_id,
    primary_key: :id,
    dependent: :destroy
  )
  
  COLORS = %w[brindle grey black blue calico white]
  
  validates :age, :birth_date, :color, :name, :sex, :description, presence: true
  validates :age, numericality: true
  validates :color, inclusion: { in: COLORS, message: "Cats aren't %{value}!" }
  validates :sex, inclusion: { in: %w[M F] }
end
