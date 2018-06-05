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

FactoryBot.define do
  factory :tags_mapper do
    tag nil
    note nil
    user nil
  end
end
