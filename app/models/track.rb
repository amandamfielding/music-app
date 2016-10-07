# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  name       :string
#  lyrics     :text
#  category   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ActiveRecord::Base
  validates :album_id, presence: true
  validates :category, presence: true, inclusion: { in: %w(regular bonus),
    message: "%{value} is not a valid category" }

  belongs_to :album
  has_many :notes,
  dependent: :destroy
end
