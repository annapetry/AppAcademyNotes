class Goal < ActiveRecord::Base
  validates :body, :user, presence: true
  
  
  
  belongs_to(
    :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id
  )
  
end
