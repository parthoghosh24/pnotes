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

require 'rails_helper'

RSpec.describe Tag, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
