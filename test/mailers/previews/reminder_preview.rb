# Preview all emails at http://localhost:3000/rails/mailers/reminder
class ReminderPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/reminder/send_reminder
  def send_reminder
    Reminder.send_reminder
  end

end
