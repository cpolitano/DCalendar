class Event < ActiveRecord::Base

  has_and_belongs_to_many :tags

  validates :name, presence: true
  validates :description, presence: true
  validates :event_time, presence: true
  validates :location, presence: true
  
  validate :event_cannot_be_in_the_past

  def event_cannot_be_in_the_past
    if self.event_time < Time.now
      errors.add(:event_time, " cannot be before today.")
    end
  end
end
