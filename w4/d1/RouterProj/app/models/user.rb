class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  
  has_many(
    :contacts,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "Contact"
  )
  has_many(
    :contact_shares,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: "ContactShare"
  )
  has_many(
    :shared_contacts,
    through: :contact_shares,
    source: :contact
  )
  has_many(
    :comment,
    :as => :commentable,
    primary_key: :id,
    foreign_key: :commentable_id,
    class_name: "Comment"
  )
end
