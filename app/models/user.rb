class User < ApplicationRecord
  # has_secure_password
  after_create :welcome_send

  has_many :organised_attendances, foreign_key: "organiser_id", class_name: "Attendance"
  has_many :participated_attendances, foreign_key: "participant_id", class_name: "Attendance"
  has_many :events, through: :attendances

  validates :first_name, presence: true, length: { in: 2..30 }
  validates :last_name, presence: true, length: { in: 2..30 }
  validates :email, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  validates :description, presence: true
  validates :encrypted_password, presence: true, length: { minimum: 6 }


 def welcome_send
   UserMailer.welcome_email(self).deliver_now
 end

  end
