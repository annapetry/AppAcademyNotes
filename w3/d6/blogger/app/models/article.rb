# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

class Article < ActiveRecord::Base
  has_many :comments
  has_many :taggings
  has_many :tags, through: :taggings

  def tag_list
    self.tags.collect do |tag|
      tag.name
    end.join(", ")
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect { |tag| tag.strip.downcase }.uniq

    new_or_found_tags = tag_names.collect do |name|
      Tag.find_or_create_by(name: name)
    end

    self.tags = new_or_found_tags
  end
end
