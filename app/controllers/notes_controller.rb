class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy, :archive, :unarchive]

  def index
    @notes = Note.where(archived: false, deleted: false)
  end

  def archive_index
    @archived_notes = Note.where(archived: true)
  end

  def show
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to @note, flash: { success: 'Note was successfully created.' }
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

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content)
  end
end
