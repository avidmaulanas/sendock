class Place < ActiveRecord::Base
  belongs_to :user
  has_many :place_comments

  validates :name, :address, :lat, :lng, :user_id, presence: true
end
