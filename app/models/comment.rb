class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :visitor, required: false
  has_many :notifications, as: :notifiable, dependent: :destroy

 validates :message, presence: true

 scope :approved, -> { where status: true }


  def status_show string
    if string == 'true'
      true
    else
      false
    end
  end


  after_save :notify

  def notify
    notifications.build.save
  end
end
