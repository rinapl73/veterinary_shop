class CreateAdminService
  def call
    user = User.find_or_create_by!(email: Rails.application.secrets.admin_email) do |user|
        user.password = Rails.application.secrets.admin_password
        user.password_confirmation = Rails.application.secrets.admin_password
        user.role = :admin
        user.name = Rails.application.secrets.admin_name
        user.zip = "12345".to_i
      end

      user = User.find_or_create_by!(email: Rails.application.secrets.receptionist_email) do |user|
        user.password = Rails.application.secrets.receptionist_password
        user.password_confirmation = Rails.application.secrets.receptionist_password
        user.role = :receptionist
        user.name = Rails.application.secrets.receptionist_name
        user.zip = "12345".to_i
      end

      user = User.find_or_create_by!(email: Rails.application.secrets.doctor_email) do |user|
        user.password = Rails.application.secrets.doctor_password
        user.password_confirmation = Rails.application.secrets.doctor_password
        user.role = :doctor
        user.name = Rails.application.secrets.doctor_name
        user.zip = "12345".to_i
      end

      user = User.find_or_create_by!(email: Rails.application.secrets.customer_email) do |user|
        user.password = Rails.application.secrets.customer_password
        user.password_confirmation = Rails.application.secrets.customer_password
        user.role = :customer
        user.name = Rails.application.secrets.customer_name
        user.zip = "12345".to_i
      end
  end
end
