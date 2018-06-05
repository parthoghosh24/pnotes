# == Schema Information
#
# Table name: tags_mappers
#
#  id         :bigint(8)        not null, primary key
#  tag_id     :bigint(8)
#  note_id    :bigint(8)
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TagsMapper < ApplicationRecord
  belongs_to :tag
  belongs_to :note
  belongs_to :user

  scope :tags_by_user, ->(tag_id,user_id){where(tag_id: tag_id, user_id: user_id)}
end
