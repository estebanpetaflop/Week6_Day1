class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances

  validates :start_date, presence: true, if: Proc.new{|a| a.start_date > Time.now}
validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }, if: Proc.new{|a| a.duration%5==0}
validates :title, presence: true, length: { in: 3 ..140 }
validates :description, presence: true, length: { in: 20..1000 }
validates :price, presence: true, numericality: { only_integer: true, greater_than: 0 }
validates :location, presence: true, length: { minimum: 6 }
end
