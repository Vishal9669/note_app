class NotesController < ApplicationController
  include Pagy::Backend
  before_action :set_note, only: [:show, :edit, :update, :destroy, :archive, :unarchive, :pin, :unpin]

  def index
   @pagy, @notes = pagy(current_user.notes.where(archived: false, deleted: false).order(pinned: :desc), items: 8)
  end

  def archive_index
    @archived_notes = current_user.notes.where(archived: true)
  end

  def show
  end

  def new
    @note = current_user.notes.new
  end

  def create
    @note = current_user.notes.new(note_params)

    if @note.save
      redirect_to notes_url, flash: { success: 'Note was successfully created.' }
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to @note, flash: { success: 'Note was successfully updated.' }
    else
      render :edit
    end
  end

  def destroy
    @note.move_to_trash
    redirect_to notes_url, flash: { success: 'Note was successfully saved in trash for 30 days.' }
  end

  def archive
    @note.update(archived: true)
    redirect_to notes_path, notice: 'Note archived successfully.'
  end

  def unarchive
    @note.update(archived: false)
    redirect_to notes_path, notice: 'Note unarchived successfully.'
  end

  def pin
    @note.update(pinned: true)
    redirect_to notes_path, notice: 'Note pinned successfully.'
  end

  def unpin
    @note.update(pinned: false)
    redirect_to notes_path, notice: 'Note unpinned successfully.'
  end

  private

  def set_note
    @note = current_user.notes.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content, :user_id)
  end
end
