class Appointment < ActiveRecord::Base
  attr_accessor :customer_email, :customer_name

  belongs_to :doctor

  validates :customer_email,
            :customer_name,
            :doctor_id,
            :pet_name,
            :visit_reason,
            presence: true


  def owner_name
    User.find(self.customer_id).name if self.customer_id
  end

  def owner_email
    User.find(self.customer_id).email if self.customer_id
  end

  def doctor_name
    User.find(self.doctor_id).name if self.doctor_id
  end



end
