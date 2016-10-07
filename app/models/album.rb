# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  band_id    :integer          not null
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  source     :string           not null
#

class Album < ActiveRecord::Base
  validates :band_id, presence: true
  validates :source, presence: true, inclusion: { in: %w(studio live),message:"%{value} is not a valid source"}

  has_many :tracks,
  dependent: :destroy
  belongs_to :band



end
