# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  name       :string(255)      not null
#  track_type :string(255)      not null
#  lyrics     :text             not null
#  created_at :datetime
#  updated_at :datetime
#

class Track < ActiveRecord::Base

  validates :album_id, :name, :track_type, :lyrics, presence: true

  belongs_to(
    :album,
    class_name: "Album",
    foreign_key: :album_id,
    primary_key: :id
  )
  has_one(
    :band,
    through: :album,
    source: :band)

  has_many(
    :notes,
    class_name: "Note",
    foreign_key: :track_id,
    primary_key: :id
  )
end

