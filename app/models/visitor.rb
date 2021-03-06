class Visitor < ApplicationRecord
  include Gravtastic
  gravtastic
  has_many :notifications, as: :notifiable, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :messages, dependent: :destroy

validates :fullname, presence: true
validates :email, format: {with: /@/, message: 'email is not valid'}



  accepts_nested_attributes_for :comments
  accepts_nested_attributes_for :messages

  after_save :notify

  def notify
    notifications.build.save
  end
end
