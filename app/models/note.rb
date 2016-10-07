# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  review     :text
#  user_id    :integer          not null
#  track_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Note < ActiveRecord::Base
  validates :user_id, :track_id, presence: true

  belongs_to :user
  belongs_to :track
  

end
