class Event < ActiveRecord::Base

  has_and_belongs_to_many :tags

  validates :name, presence: true
  validates :description, presence: true
  validates :event_time, presence: true
  validates :location, presence: true
  
end
