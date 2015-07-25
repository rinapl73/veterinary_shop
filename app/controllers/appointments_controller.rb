class AppointmentsController < ApplicationController
  before_filter :authenticate_user!

  before_action :set_appointment, only: [:show, :edit, :update, :destroy]
  before_action :set_doctor

  # GET /appointments
  # GET /appointments.json
  def index
    if (current_user.role == "admin") || (current_user.role == "receptionist")
      @appointments = Appointment.all
    else
      @appointments = @doctor.appointments
    end
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
    @doctors = []
    User.where(role: 2).each do |u|
      @doctors << [u.name, u.id]
    end
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)



    respond_to do |format|
      if @appointment.save
        email = params[:appointment][:customer_email]
        customer_name = params[:appointment][:customer_name]
        if email
          @appointment.customer_id = customer_add(email, customer_name)
          @appointment.save
        end

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
    respond_to do |format|
      if @appointment.update(appointment_params)

        email = params[:appointment][:customer_email]
        customer_name = params[:appointment][:customer_name]
        if email
          @appointment.customer_id = customer_add(email, customer_name)
          @appointment.save
        end

        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def reminder
    Reminder.send_reminder(@appointment).deliver_now
    redirect_to appointments_path, notice: "Reminder send successfully."
  end


  private


    def customer_add(customer_email, customer_name)
      user = User.find_or_create_by!(email: customer_email) do |user|
        user.password = "password"
        user.password_confirmation = "password"
        user.role = :customer
        user.name = customer_name
        user.zip = "12345"
      end
      return user.id
    end

    def set_doctor
      @doctor = Doctor.find(current_user.id)
       @doctors = []
        User.where(role: 2).each do |u|
          @doctors << [u.name, u.id]
        end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:reminder, :last_appointment_date, :appointment_date, :pet_name, :doctor_id, :pet_type, :pet_breed, :pet_age, :weight, :customer_id, :visit_reason, :doctor_comment, :customer_email, :customer_name)
    end
end
