class Issue < ApplicationRecord
  belongs_to :recruitment
  belongs_to :creator
  belongs_to :musician
  has_many :messages, dependent: :destroy
  has_one :notification, dependent: :destroy
  
  # status
  enum status: { 未着手: 0, 作成中: 1, 作成完了: 2}
  
  # 通知
  def create_notification_issue!(current_musician)
    entries = Entry.where(recruitment_id: recruitment.id)
     # creator_idを取得する
    entries.each do |entry|
      notification = current_musician.active_notifications.new(
        visitor_musician_id: current_musician.id,
        issue_id: self.id,
        visited_creator_id: entry.creator_id,
        action: 'issue',
        is_musician: 'true'
        )
      notification.save if notification.valid?
    end
  end


 end
