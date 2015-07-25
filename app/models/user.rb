class User < ActiveRecord::Base
  enum role: [:admin, :receptionist, :doctor, :customer]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :customer
  end

  def self.zip
    zip.to_i
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, length: { maximum: 35 }
  validates :email, presence: true
  validates :zip, presence: true, length: { in: 1..5 }, numericality: true
end
