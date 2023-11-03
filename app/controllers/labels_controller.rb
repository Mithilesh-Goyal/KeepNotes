class LabelsController < ApplicationController

    def index
      @labels = Label.all
      @labels = Label.where("label_name LIKE ? ","%#{params[:query.downcase]}%" )
    end

    def show
      @notes = Note.all
      @labels = Label.all
      @label = Label.find(params[:id])
      @notes = @label.notes
    end

    def shownotes
      @label = Label.find(params[:id])
      @notes = @label.notes
    end

    def new
      @label = Label.new

    end

    def create
      @label = Label.new(label_params)
      if @label.save
         redirect_to @label
      else
        render :new
      end
    end

    def edit
      @label = Label.find(params[:id])
    end

    def update
      @label = Label.find_by_id(params[:id])

      if @label.update(label_params)
        redirect_to label_path(@label)
      else
        render :edit
      end
    end

    def destroy
      @label = Label.find(params[:id])
      @label.destroy
      redirect_to root_path :id
    end

    def new_label
      @labels = Label.all
    end


   private
      def set_label
        @label = Label.find(params[:id])
      end

      def label_params
        params.require(:label).permit(:label_name , :note_id)
      end
  end
