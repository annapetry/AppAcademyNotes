class ContactShare < ActiveRecord::Base
  validates :contact_id, presence: true,  :uniqueness => {:scope => :user_id}
  validates :user_id, presence: true
  
  belongs_to(
    :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "User"
  )
  belongs_to(
    :contact,
    primary_key: :id,
    foreign_key: :contact_id,
    class_name: "Contact"
  )
  
  has_many(
    :comment, as: :commentable,
    primary_key: :id,
    foreign_key: :commentable_id,
    class_name: "Comment"
  )
end
