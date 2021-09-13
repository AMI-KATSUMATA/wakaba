class RecruitUser::NotificationsController < ApplicationController
  def index
    @notifications = current_musician.passive_notifications
    # .page(params(:page)).per(20)
    @notifications = Notification.where(visited_id: current_musician.id)
                                 .where(checked: false)
                                 .where(is_musician: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end
end
