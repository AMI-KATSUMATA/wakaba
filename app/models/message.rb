class Message < ApplicationRecord
  belongs_to :creator, optional: true
  belongs_to :musician, optional: true
  belongs_to :issue
  has_one :notification, dependent: :destroy
  has_one_attached :image


  validates :issue_id, presence: true
  validates :content, length: { maximum: 5000 }, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end


   #通知
  def create_notification_creator_message!(current_creator)
      notification = current_creator.active_notifications.new(
        visitor_creator_id: current_creator.id,
        message_id: self.id,
        visited_musician_id: issue.musician_id,
        action: 'message'
        )
        notification.save if notification.valid?
  end

  def create_notification_musician_message!(current_musician)
      notification = current_musician.active_notifications.new(
        visitor_musician_id: current_musician.id,
        message_id: self.id,
        visited_creator_id: issue.creator_id,
        action: 'message',
        is_musician: 'true'
        )
        notification.save if notification.valid?
  end



end
