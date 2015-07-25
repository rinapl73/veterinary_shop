class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :pet_name
      t.string :pet_type
      t.string :pet_breed
      t.text :visit_reason
      t.text :doctor_comment
      t.float :weight
      t.boolean :reminder, default: false

      t.date :appointment_date
      t.date :last_appointment_date
      t.date :pet_age

      t.integer :doctor_id
      t.integer :customer_id

      t.timestamps null: false
    end
  end
end
