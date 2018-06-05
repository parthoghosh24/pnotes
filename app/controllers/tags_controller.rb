class TagsController < ApplicationController
  before_action :authenticate_user!
  before_action :tag
  def show
  	@tag_notes = tag.notes_by_user(current_user)
  end

  private
  def tag
  	@tag = Tag.find_by(name:params[:tag])
  end
end
