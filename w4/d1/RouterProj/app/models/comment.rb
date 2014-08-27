class Comment < ActiveRecord::Base
  belongs_to(
    :commentable,
    primary_key: :id,
    foreign_key: :commentable_id,
    polymorphic: true
  )


end
