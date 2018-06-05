# == Schema Information
#
# Table name: tags
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  unique_id  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord
  validates :name, presence: true
  validates :unique_id, presence: true

  def self.create_tags(note_id,current_user,tags)
  	if tags.size > 0
  		tags.each do |tag|
  			tag_obj = Tag.find_or_create_by(name:tag,unique_id:tag.parameterize)
  			puts "tag #{tag_obj.inspect}"
  			TagsMapper.find_or_create_by({tag_id:tag_obj.id,note_id:note_id,user_id:current_user.id})	
  		end
  	end
  end

  def notes_by_user(user)
  	 Note.where(id:TagsMapper.tags_by_user(self.id,user.id).pluck(:note_id))
  end
end
