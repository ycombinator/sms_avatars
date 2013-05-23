class App < ActiveRecord::Base
  attr_accessible :avatar_switch_command, :incoming_sms_uri, :name
  has_many :test_numbers
end
