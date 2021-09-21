class RecruitUser::NotificationsController < ApplicationController
  before_action :authenticate_musician!
  
  def index
    #@notifications = current_musician.entry_notifications
    @notifications = current_musician.passive_notifications
    # .page(params(:page)).per(20)
    @notifications = Notification.where(visited_musician_id: current_musician.id)
                                 .where(checked: false)
                                 .where(is_musician: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end
end
