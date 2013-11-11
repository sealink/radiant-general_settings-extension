class MigrateGeneralSettings < ActiveRecord::Migration
  def self.up
    # Do not do data-migration when testing
    #
    # ...questionable that we should be doing data-cleaning
    # in migrations - maybe better suited to one-off tasks?
    return if defined?(TESTING) && TESTING

    # Rename of 'general_text' => 'general_setting'
    conn = ActiveRecord::Base.connection
    conn.tables.each do |table|
      columns = conn.execute("desc #{table}")
      columns.each do |c|
        name, type, *other = c
        if type['text']
          command = "UPDATE `#{table}` 
                     SET `#{name}` = REPLACE(`#{name}`, 'r:general_text', 'r:general_setting')"
          puts command.inspect
          conn.execute command
        end
      end
    end
  end

  def self.down
  end
end
