class Entry < ApplicationRecord

  belongs_to :creator
  belongs_to :recruitment
  has_one :notification, dependent: :destroy

  # エントリー
  def entried_by?(creator)
    entries.where(creator_id: creator.id).exists?
  end

 #通知
  def create_notification_entry!(current_creator)
    # すでにエントリーされているか
    temp = Notification.where(visitor_creator_id: current_creator.id)
                       .where(visited_musician_id: recruitment.musician_id)
                       .where(entry_id: self.id)
                       .where(action: 'entry')
    # エントリーされていない場合
    if temp.blank?
      notification = current_creator.active_notifications.new(
        visitor_creator_id: current_creator.id,
        entry_id: self.id,
        visited_musician_id: recruitment.musician_id,
        action: 'entry'
        )
        notification.save if notification.valid?
    end
  end


end
