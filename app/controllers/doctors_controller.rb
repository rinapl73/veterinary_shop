class DoctorsController < ApplicationController
  before_filter :authenticate_user!

  before_action :set_doctor, only: [:show, :edit, :update, :destroy]

  # GET /Users
  # GET /Users.json
  def index
    @doctors = Doctor.all
  end

  # GET /Users/1
  # GET /Users/1.json
  def show
  end

  # GET /Users/new
  def new
    @doctor = Doctor.new
  end

  # GET /Users/1/edit
  def edit
  end

  # POST /Users
  # POST /Users.json
  def create
    @doctor = Doctor.new(doctor_params)

    respond_to do |format|
      if @doctor.save
        format.html { redirect_to @doctor, notice: 'Doctor was successfully created.' }
        format.json { render :show, status: :created, location: @doctor }
      else
        format.html { render :new }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Users/1
  # PATCH/PUT /Users/1.json
  def update
    respond_to do |format|
      if @doctor.update(doctor_params)
        format.html { redirect_to @doctor, notice: 'Doctor was successfully updated.' }
        format.json { render :show, status: :ok, location: @doctor }
      else
        format.html { render :edit }
        format.json { render json: @doctor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Users/1
  # DELETE /Users/1.json
  def destroy
    @doctor.destroy
    respond_to do |format|
      format.html { redirect_to doctors_url, notice: 'Doctor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_params
      params.require(:doctor).permit(:password, :password_confirmation, :email, :name, :address, :city, :state, :zip, :school_name, :years_in_practice,)
    end
end
