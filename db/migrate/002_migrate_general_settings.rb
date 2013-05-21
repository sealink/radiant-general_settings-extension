class MigrateGeneralSettings < ActiveRecord::Migration
  def self.up
    conn = ActiveRecord::Base.connection
    conn.tables.each do |table|
      columns = conn.execute("desc #{table}")
      columns.each do |c|
        name, type, *other = c
        if type['text']
          command = "UPDATE `#{table}` SET `#{name}` = REPLACE(`#{name}`, 'r:general_text', 'r:general_setting')"
          puts command.inspect
          conn.execute command
        end
      end
    end
  end

  def self.down
  end
end
