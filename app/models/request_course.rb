class RequestCourse < ApplicationRecord
  belongs_to :user
  belongs_to :course

  scope :this_month, -> { where(created_at: Time.now.beginning_of_month..Time.now.end_of_month) }

  validates_uniqueness_of :course, :scope => :user_id

  enum status: [:pending, :accept, :rejected, :done]

  after_update :notify_user

  def notify_user
    UserMailer.notification_mail(self.user, "Your course join request has been accepted!").deliver_now if self.status == "accept"
  end
end
