class App < ActiveRecord::Base
  attr_accessible :avatarSwitchCommand, :incomingSmsUri, :name
  has_many :test_numbers
end
