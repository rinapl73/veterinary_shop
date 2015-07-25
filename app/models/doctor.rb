class Doctor < User
  has_many :appointments
  has_many :users
  def set_default_role
    self.role ||= :doctor
  end
end
