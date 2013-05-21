class TestNumber < ActiveRecord::Base
  attr_accessible :active_avatar_id, :app_id, :number
  belongs_to :app
  has_many :avatars, :class_name => 'Avatar'
  belongs_to :active_avatar, :class_name => 'Avatar'
end
