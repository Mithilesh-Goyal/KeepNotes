class NotesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @new_note = Note.new
    @labels = Label.all
    if params[:query].present?
      @notes = Note.where("title ILIKE ? OR content LIKE ? ","%#{params[:query]}%", "%#{params[:query]}%" )
    else
      # @notes = Note.all
      @notes = Note.order('created_at DESC')
    end
  end

  def show
    @note = Note.find(params[:id])
      respond_to do |format|
      format.js
    end
  end

  def new
    @notes = Note.all
    @labels = Label.all
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    respond_to do |format|
      if @note.save
        format.html { redirect_to notes_path }
        format.js   # This will render create.js.erb
        format.json { render json: @note, status: :created, location: @note }
      else
        format.html { render :index }
      end
    end
  end

  def edit
    @note = Note.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      respond_to do |format|
        # format.html {redirect_to notes_path}
        format.js
      end
    else
      redirect_to notes_path, alert: 'Failed to update note.'
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    redirect_to notes_bin_path :id
  end

  def archive
    @note = Note.find(params[:id])
    @note.update(status: 'archived')
    @note.update(pin: 'false')
    redirect_to :notes, notice: 'Successfully Archived'
  end

  def notarchive
    @note = Note.find(params[:id])
    @note.update(status: 'active')
    redirect_to :notes, notice: 'Successfully restored'
  end

  # def soft_delete
  #   @note = Note.find(params[:id])
  #   # @note.update(deleted_at: DateTime.now)
  #   @note.update(stage: 'del')
  #   redirect_to :notes, notice: 'Successfully'
  # end

  def soft_delete
    @note = Note.find(params[:id])
    @note.update(stage: 'del')
    # @note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
      format.js   # This will look for a destroy.js.erb file
    end
  end

  def restore
    @note = Note.find(params[:id])
    @note.update(stage: 'notdel')
    @note.update(deleted_at: nil)
    redirect_to :notes_bin, notice: 'Successfully restored'
  end

  def pinned
    @note = Note.find(params[:id])
    @note.update(pin: 'true')
    @note.update(updated_at:Time.now)
    redirect_to :notes
  end

  def unpinned
    @note = Note.find(params[:id])
    @note.update(pin: 'false')
    redirect_to :notes
  end

  def archived
    @notes = Note.all
    @labels = Label.all
    if params[:query].present?
      @notes = Note.where("(title.upcase LIKE ? OR lower(content) LIKE ? ","%#{params[:query]}%", "%#{params[:query]}%")
    else
      @notes = Note.all
    end
  end

  def bin
    @notes = Note.all
    @labels = Label.all
    if params[:query].present?
      @notes = Note.where("title LIKE ? OR content LIKE ? ","%#{params[:query]}%", "%#{params[:query]}%" )
    else
      @notes = Note.all
    end
  end

  def show_label
    @notes = Note.all
    @labels = Label.all
  end

  def active
    @notes = Note.all
  end

  def add_label
    @note = Note.find(params[:id])
    @labels = Label.where(id: params[:note][:label_ids])
    @note.labels = @labels
    redirect_to :notes
  end

  def copy
    @note = Note.find(params[:id])
    @new_note = @note.dup
    @new_note.pin = false
    if @new_note.save
      redirect_to notes_path, notice: 'Note was successfully copied.'
    else
      redirect_to labels_path, alert: 'Failed to copy note.'
    end
  end

  def set_reminder
    @note = Note.find(params[:id])
    if @note.update(note_params)
      flash[:notice] = 'Reminder set successfully!'
      redirect_to @note
    else
      render 'edit'
    end
  end

  def delete_image
    @note = Note.find(params[:id])

    begin
      @note.image.purge
      flash[:success] = "Image deleted successfully."
    rescue => e
      flash[:error] = "Failed to delete the image: #{e.message}"
    end
    redirect_to :notes
  end

  private
    def set_note
      @note = Note.find(params[:id])
    end

    def note_params
      params.require(:note).permit(:title, :content ,:label_id,:color,:state , :status ,:pin , :image ,:background_image,:deleted_at , :unique_id , :reminder)
    end
end
