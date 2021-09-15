class ApplyUser::NotificationsController < ApplicationController
  def index
    #@notifications = current_musician.entry_notifications
    @notifications = current_creator.passive_notifications
    # .page(params(:page)).per(20)
    @notifications = Notification.where(visited_creator_id: current_creator.id)
                                 .where(checked: false)
                                 .where(is_musician: true).each do |notification|
      notification.update_attributes(checked: true)
    end
  end
end
