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
  before(:all) do
 	@user = User.create!(email:"foo@gmail.com", password:"test123",password_confirmation:"test123")
 	@note1 = Note.create!(title:"title 1",body:"This is a test body 1", user_id: @user.id)
 	@note1.add_tags(@user,["tag1","tag2","tag3","tag4"])
 	@tag2 = Tag.find_by(name:"tag2")
 	@note2 = Note.create!(title:"title 2",body:"This is a test body 2", user_id: @user.id)
 	@note2.add_tags(@user,["tag2","tag6","tag5"])
 	@tag6 = Tag.find_by(name:"tag6")
 end

 it "should return 2 notes for tag2" do
 	expect(@tag2.notes_by_user(@user).size).to eq(2)
 end

 it "should return title as 'title 2' for note returned by tag6" do
 	expect(@tag6.notes_by_user(@user)[0].title).to eq("title 2")
 end
end
