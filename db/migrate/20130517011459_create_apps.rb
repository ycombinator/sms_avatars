class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.string :incoming_sms_uri
      t.string :avatar_switch_command

      t.timestamps
    end
  end
end
