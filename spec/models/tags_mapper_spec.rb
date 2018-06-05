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

require 'rails_helper'

RSpec.describe TagsMapper, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
