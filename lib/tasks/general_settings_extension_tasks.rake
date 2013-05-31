namespace :radiant do
  namespace :extensions do
    namespace :general_settings do
      desc "Runs the migration of the General Settings extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          GeneralSettingsExtension.migrator.migrate(ENV["VERSION"].to_i)
          Rake::Task['db:schema:dump'].invoke
        else
          GeneralSettingsExtension.migrator.migrate
          Rake::Task['db:schema:dump'].invoke
        end
      end
    end
  end
end
