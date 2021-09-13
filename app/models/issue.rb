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
    notification = current_musician.active_notifications.new(
      issue_id: id,
      visited_id: creator_id,
      action: 'issue'
      )
      notification.save if notification.valid?
  end

 end
