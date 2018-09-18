class AppoitmentsController < ApplicationController
  before_action :set_appoitment, only: [:show, :edit, :update, :destroy]

  # GET /appoitments
  # GET /appoitments.json
  def index
    @appoitments = Appoitment.all
  end

  # GET /appoitments/1
  # GET /appoitments/1.json
  def show
  end

  # GET /appoitments/new
  def new
    @appoitment = Appoitment.new
  end

  # GET /appoitments/1/edit
  def edit
  end

  # POST /appoitments
  # POST /appoitments.json
  def create
    @appoitment = Appoitment.new(appoitment_params)

    respond_to do |format|
      if @appoitment.save
        format.html { redirect_to @appoitment, notice: 'Appoitment was successfully created.' }
        format.json { render :show, status: :created, location: @appoitment }
      else
        format.html { render :new }
        format.json { render json: @appoitment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appoitments/1
  # PATCH/PUT /appoitments/1.json
  def update
    respond_to do |format|
      if @appoitment.update(appoitment_params)
        format.html { redirect_to @appoitment, notice: 'Appoitment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appoitment }
      else
        format.html { render :edit }
        format.json { render json: @appoitment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appoitments/1
  # DELETE /appoitments/1.json
  def destroy
    @appoitment.destroy
    respond_to do |format|
      format.html { redirect_to appoitments_url, notice: 'Appoitment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appoitment
      @appoitment = Appoitment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appoitment_params
      params.require(:appoitment).permit(:description, :start_time, :end_time, :user_id, :field_id, )
    end
end
