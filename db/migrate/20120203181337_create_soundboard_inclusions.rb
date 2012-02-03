class CreateSoundboardInclusions < ActiveRecord::Migration
  def change
    create_table :soundboard_inclusions do |t|
      t.integer :user_id
      t.integer :sound_id
      t.integer :position

      t.timestamps
    end
  end
end
