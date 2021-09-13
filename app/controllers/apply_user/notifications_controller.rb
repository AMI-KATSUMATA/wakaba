class ApplyUser::NotificationsController < ApplicationController
  def index
    @notifications.where(visited_id: current_creator.id)
                  .where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end
end
