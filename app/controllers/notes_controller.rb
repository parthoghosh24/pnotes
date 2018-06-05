class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :note, only: [:show, :edit, :update] 

  def index
  	@notes = current_user.notes.order(created_at: :desc)
  end

  def new
  end

  def create
  	tags = params[:note].extract!(:tag_ids)
  	params[:note][:user_id]=params[:note][:user_id].to_i
  	note = Note.new(note_params)
  	if note.save
  		note.add_tags(current_user,tags[:tag_ids].split(","))
  		redirect_to root_path
  	else
  		@errors = note.errors
  		render :new
  	end
  end

  def show
  end

  def edit
  end

  def update
  	tags = params[:note].extract!(:tag_ids)
  	params[:note][:user_id]=params[:note][:user_id].to_i
  	if note.update(note_params)
  		redirect_to root_path
  	else
  		@errors = note.errors
  		render :edit, id: note.id
  	end
  end

  private

  def note_params
  	params.require(:note).permit(:title,:body,:user_id)
  end

  def note
  	@note = Note.find(params[:id])
  end
  
end
