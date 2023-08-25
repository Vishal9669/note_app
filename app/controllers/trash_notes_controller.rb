class TrashNotesController < ApplicationController
  before_action :set_trash_note, only: [:destroy, :restore]

  def index
    @trash_notes = current_user.notes.deleted
  end

  def destroy
    @trash_note.destroy
    redirect_to trash_notes_path, notice: 'Note was successfully destroyed.'
  end

  def restore
    @note = current_user.notes.new(
      title: @trash_note.title,
      content: @trash_note.content
    )

    if @note.save
      @trash_note.destroy
      redirect_to notes_path, notice: 'Note was successfully restored.'
    else
      redirect_to trash_notes_path, alert: 'Failed to restore note.'
    end
  end

  private

  def set_trash_note
    @trash_note = current_user.notes.find(params[:id])
  end

  def trash_note_params
    params.require(:trash_note).permit(:id)
  end
end
