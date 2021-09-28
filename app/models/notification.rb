class Notification < ApplicationRecord
  belongs_to :issue, optional: true
  belongs_to :entry, optional: true
  belongs_to :message, optional: true

  belongs_to :visitor_creator, class_name: 'Creator', optional: true
  belongs_to :visited_creator, class_name: 'Creator', optional: true

  belongs_to :visitor_musician, class_name: 'Musician', optional: true
  belongs_to :visited_musician, class_name: 'Musician', optional: true
  
  validates :checked, inclusion: { in: [true, false] }
  validates :action, presence: true
  validates :is_musician, inclusion: { in: [true, false] }

end
