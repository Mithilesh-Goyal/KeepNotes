class NoteslabelController < ApplicationController
  def new
    @noteslabel = Noteslabel.new
  end

  def create
    @noteslabel = Noteslabel.new(noteslabel_params)
    if  @noteslabel.save
      redirect_to @note
    else
      render :new
    end
  end

  private
    def noteslabel_params
      params.require(:noteslabel).permit(:note_id, :label_id)
    end
end
