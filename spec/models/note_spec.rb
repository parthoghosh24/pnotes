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

require 'rails_helper'

describe Note, type: :model do
  before(:all) do
 	@user = User.create!(email:"foo+1@gmail.com", password:"test123",password_confirmation:"test123")
 	@note1 = Note.create!(title:"title 1",body:"This is a test body 1", user_id: @user.id)
 	@note1.add_tags(@user,["tag1","tag2","tag3","tag4"])
 	@note2 = Note.create!(title:"title 2",body:"This is a test body 2", user_id: @user.id)
 	@note2.add_tags(@user,["tag2","tag6","tag5"])
 end

 it "should return count as 4 for note 1" do
 	expect(@note1.tags.size).to eq(4)
 end

 it "should return count as tag5, tag6 and tag2 for note 2" do
 	expect(@note2.tags.pluck(:name)).to eq(["tag5","tag6","tag2"])
 end

end
