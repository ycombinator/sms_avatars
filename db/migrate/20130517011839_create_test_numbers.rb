class CreateTestNumbers < ActiveRecord::Migration
  def change
    create_table :test_numbers do |t|
      t.string :number
      t.integer :app_id
      t.integer :active_avatar_id

      t.timestamps
    end
  end
end
