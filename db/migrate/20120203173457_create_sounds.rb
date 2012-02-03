class CreateSounds < ActiveRecord::Migration
  def change
    create_table :sounds do |t|
      t.string :file
      t.string :title
      t.integer :user_id

      t.timestamps
    end
  end
end
