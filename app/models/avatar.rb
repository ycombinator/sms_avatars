class Avatar < ActiveRecord::Base
  attr_accessible :name, :number, :test_number_id
  belongs_to :test_number
  has_one :test_number, :foreign_key => :active_avatar_id
end
