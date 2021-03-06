## This is the rakegem gemspec template. Make sure you read and understand
## all of the comments. Some sections require modification, and others can
## be deleted if you don't need them. Once you understand the contents of
## this file, feel free to delete any comments that begin with two hash marks.
## You can find comprehensive Gem::Specification documentation, at
## http://docs.rubygems.org/read/chapter/20
Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.rubygems_version = '1.3.5'

  ## Leave these as is they will be modified for you by the rake gemspec task.
  ## If your rubyforge_project name is different, then edit it and comment out
  ## the sub! line in the Rakefile
  s.name = 'radiant-general_settings-extension'
  s.version = '0.0.1'
  s.date = '2013-05-31'

  ## Make sure your summary is short. The description may be as long
  ## as you like.
  s.summary = "Extension to manage custom settings."
  s.description = "See README for full details on how to install, use, etc."

  ## List the primary authors. If there are a bunch of authors, it's probably
  ## better to set the email to an email list or something. If you don't have
  ## a custom homepage, consider using your GitHub URL or the like.
  s.authors = ["Michael Noack"]
  s.email = 'support@travellink.com.au'
  s.homepage = 'http://github.com/sealink/radiant-general_settings-extension'

  ## This gets added to the $LOAD_PATH so that 'lib/NAME.rb' can be required as
  ## require 'NAME.rb' or'/lib/NAME/file.rb' can be as require 'NAME/file.rb'
  s.require_paths = %w[lib]

  ## This sections is only necessary if you have C extensions.
  # s.require_paths << 'ext'
  # s.extensions = %w[ext/extconf.rb]

  ## If your gem includes any executables, list them here.
  # s.executables = ["name"]

  ## Specify any RDoc options here. You'll want to add your README and
  ## LICENSE files to the extra_rdoc_files list.
  s.rdoc_options = ["--charset=UTF-8"]
  s.extra_rdoc_files = %w[README.md]

  ## List your runtime dependencies here. Runtime dependencies are those
  ## that are needed for an end user to actually USE your code.

  # For shared and nested layouts
  s.add_dependency('radius')

  ## List your development dependencies here. Development dependencies are
  ## those that are only needed during development
  # s.add_development_dependency('DEVDEPNAME', [">= 1.1.0", "< 2.0.0"])
  s.add_development_dependency('rspec', '>= 2.0')
  s.add_development_dependency('activerecord', '>= 2.3')
  s.add_development_dependency('sqlite3')

  ## Leave this section as-is. It will be automatically generated from the
  ## contents of your Git repository via the gemspec task. DO NOT REMOVE
  ## THE MANIFEST COMMENTS, they are used as delimiters by the task.
  # = MANIFEST =
  s.files = %w[
    Gemfile
    README.md
    Rakefile
    app/controllers/admin/general_settings_controller.rb
    app/models/general_setting.rb
    app/views/admin/general_settings/edit.html.haml
    app/views/admin/general_settings/index.html.haml
    app/views/admin/general_settings/new.html.haml
    config/routes.rb
    db/migrate/001_create_general_settings.rb
    db/migrate/002_migrate_general_settings.rb
    general_settings_extension.rb
    lib/radiant-general_settings-extension.rb
    lib/tags/general_settings_tags.rb
    lib/tasks/general_settings_extension_tasks.rake
    radiant-general_settings-extension.gemspec
    spec/radius_spec_helper.rb
    spec/spec_helper.rb
  ]
  # = MANIFEST =

  ## Test files will be grabbed from the file list. Make sure the path glob
  ## matches what you actually use.
  s.test_files = s.files.select { |path| path =~ /^test\/test_.*\.rb/ }
end
