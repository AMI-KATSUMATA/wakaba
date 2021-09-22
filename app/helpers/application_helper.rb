module ApplicationHelper
  def creator_unchecked_notifications
    @notifications = current_creator.passive_notifications.where(checked: false)
  end
  
  def musician_unchecked_notifications
    @notifications = current_musician.passive_notifications.where(checked: false)
  end
end
