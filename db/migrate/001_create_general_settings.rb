class CreateGeneralSettings < ActiveRecord::Migration
  def self.up
    create_table :general_settings do |t|
      t.string :key
      t.text :value
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :general_settings
  end
end
