class Event < ActiveRecord::Base
  belongs_to :user, required: true

  has_many :comments, dependent: :destroy
  has_many :attendees, dependent: :destroy
  has_many :users_joined, through: :attendees, source: :user
end
