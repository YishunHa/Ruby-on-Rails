class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :visitor
  has_many :notifications, as: :notifiable, dependent: :destroy

  def status_show string
    if string == 'true'
      true
    else
      false
    end
  end
end
