# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'rails_helper'

describe User, type: :model do
 before(:all) do
 	@user = User.create!(email:"foo+2@gmail.com", password:"test123",password_confirmation:"test123")
 	@note1 = Note.create!(title:"title 1",body:"This is a test body 1", user_id: @user.id)
 	@note1.add_tags(@user,["tag1","tag2","tag3","tag4"])
 	@tag2 = Tag.find_by(name:"tag2")
 	@note2 = Note.create!(title:"title 2",body:"This is a test body 2", user_id: @user.id)
 	@note2.add_tags(@user,["tag2","tag6","tag5"])
 end

 it "should validate presence of email in user" do
 	expect(@user).to validate_presence_of :email
 end

 it "should return 2 tags for user" do
 	expect(TagsMapper.tags_by_tag_and_user(@tag2.id,@user.id).size).to eq(2)
 end

end
