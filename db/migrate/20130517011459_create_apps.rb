class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.string :incomingSmsUri
      t.string :avatarSwitchCommand

      t.timestamps
    end
  end
end
