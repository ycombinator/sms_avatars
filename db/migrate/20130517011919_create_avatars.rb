class CreateAvatars < ActiveRecord::Migration
  def change
    create_table :avatars do |t|
      t.string :name
      t.string :number
      t.integer :test_number_id

      t.timestamps
    end
  end
end
