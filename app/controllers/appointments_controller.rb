class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = Appointment.all
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
 
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
    @field = Field.all
    @user = User.all
  end

  # GET /appointments/1/edit
  def edit
    @field = Field.all
    @user = User.all
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)
    @field = Field.all
    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    if current_user.admin
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  else 
    if @appointment.user_id == current_user.id
      respond_to do |format|
        if @appointment.update(appointment_params)
          format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
          format.json { render :show, status: :ok, location: @appointment }
        else
          format.html { render :edit }
          format.json { render json: @appointment.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to '/pages/error'
    end

  end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    if current_user.admin
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  else 
    if @appointment.user_id == current_user.id
      @appointment.destroy
     redirect_to appointments_url, notice: 'Appointment was successfully destroyed.'
       
      else
        redirect_to 'pages/error'
   
  end
end
  end

  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:title, :description, :start_time, :end_time, :user_id, :field_id)
    end
end
