class ConsumersController < ApplicationController
  before_action :set_consumer, only: %i[ show edit update destroy ]

  # GET /consumers or /consumers.json
  def index
    @consumers = Consumer.all
  end

  # GET /consumers/1 or /consumers/1.json
  def show
  end

  # GET /consumers/new
  def new
    @consumer = Consumer.new
  end

  # GET /consumers/1/edit
  def edit
  end

  # POST /consumers or /consumers.json
  # def create
  #   @consumer = Consumer.new(consumer_params)

  #   respond_to do |format|
  #     if @consumer.save
  #       format.html { redirect_to consumer_url(@consumer), notice: "Consumer was successfully created." }
  #       format.json { render :show, status: :created, location: @consumer }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @consumer.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end


  def create
    @consumer = Consumer.new(params[:user])

    respond_to do |format|
      if @consumer.save
        # Tell the UserMailer to send a welcome Email after save
        ConsumerMailer.welcome_email(@consumer).deliver

        format.html { redirect_to(@consumer, :notice => 'User was successfully created.') }
        format.json { render :json => @consumer, :status => :created, :location => @consumer }
      else
        format.html { render :action => "new" }
        format.json { render :json => @consumer.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consumers/1 or /consumers/1.json
  def update
    respond_to do |format|
      if @consumer.update(consumer_params)
        format.html { redirect_to consumer_url(@consumer), notice: "Consumer was successfully updated." }
        format.json { render :show, status: :ok, location: @consumer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @consumer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consumers/1 or /consumers/1.json
  def destroy
    @consumer.destroy

    respond_to do |format|
      format.html { redirect_to consumers_url, notice: "Consumer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consumer
      @consumer = Consumer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def consumer_params
      params.require(:consumer).permit(:name, :email, :login)
    end
end
