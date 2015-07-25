require 'test_helper'

class AppointmentsControllerTest < ActionController::TestCase
  setup do
    @appointment = appointments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:appointments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create appointment" do
    assert_difference('Appointment.count') do
      post :create, appointment: { appointment_date: @appointment.appointment_date, customer_id: @appointment.customer_id, doctor_comment: @appointment.doctor_comment, doctor_id: @appointment.doctor_id, pet_age: @appointment.pet_age, pet_breed: @appointment.pet_breed, pet_name: @appointment.pet_name, pet_type: @appointment.pet_type, veterinary_patient_id: @appointment.veterinary_patient_id, visit_reason: @appointment.visit_reason, weight: @appointment.weight }
    end

    assert_redirected_to appointment_path(assigns(:appointment))
  end

  test "should show appointment" do
    get :show, id: @appointment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @appointment
    assert_response :success
  end

  test "should update appointment" do
    patch :update, id: @appointment, appointment: { appointment_date: @appointment.appointment_date, customer_id: @appointment.customer_id, doctor_comment: @appointment.doctor_comment, doctor_id: @appointment.doctor_id, pet_age: @appointment.pet_age, pet_breed: @appointment.pet_breed, pet_name: @appointment.pet_name, pet_type: @appointment.pet_type, veterinary_patient_id: @appointment.veterinary_patient_id, visit_reason: @appointment.visit_reason, weight: @appointment.weight }
    assert_redirected_to appointment_path(assigns(:appointment))
  end

  test "should destroy appointment" do
    assert_difference('Appointment.count', -1) do
      delete :destroy, id: @appointment
    end

    assert_redirected_to appointments_path
  end
end
