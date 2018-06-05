# == Schema Information
#
# Table name: notes
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Note < ApplicationRecord
	validates :title, presence: true
  	validates :body, presence: true
  	belongs_to :user
	has_many :tags_mappers
	has_many :tags, through: :tags_mappers

	after_create :persist_tags

	def add_tags(current_user,tag_tokens)
		Tag.create_tags(self.id,current_user,tag_tokens)
	end

	# def update_tags(current_user,tag_tokens)
		
	# end

	private

	def persist_tags

	end
end
