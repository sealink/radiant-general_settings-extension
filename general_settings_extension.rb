# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'
class GeneralSettingsExtension < Radiant::Extension
  version "1.0"
  description "This extension allows creating and management of settings"
  url ''


  def activate
    require 'tags/general_settings_tags'
    Page.send :include, GeneralSettingsTags

    tab "Content" do
      add_item "General Settings", "/admin/general_settings"
    end
  end


  def deactivate
  end
end
