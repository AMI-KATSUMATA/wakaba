class Entry < ApplicationRecord

  belongs_to :creator
  belongs_to :recruitment
  has_one :notification, dependent: :destroy

 #通知
  def create_notification_entry!(current_creator)
    # すでにエントリーされているか
    temp = Notification.where(visitor_id: current_creator.id)
                       .where(visited_id: recruitment.musician_id)
                       .where(entry_id: id)
                       .where(action: 'entry')
    # エントリーされていない場合
    if temp.blank?
      notification = current_creator.active_notifications.new(
        visitor_id: current_creator.id,
        entry_id: id,
        visited_id: recruitment.musician_id,
        action: 'entry'
        )
        notification.save if notification.valid?
    end
  end


end
