class VisitorsController < ApplicationController
  before_filter :authenticate_user! , only: [:dashboard]
  def dashboard
    @appointments = Appointment.where(customer_id: current_user.id) if current_user
    # redirect_to appointments_path if (current_user.role == "receptionist" ||  current_user.role == "doctor")

  end
end
