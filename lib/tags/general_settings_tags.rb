module GeneralSettingsTags

  if defined? Radiant
    include Radiant::Taggable
  else
    include RadiusSpecHelper
  end

  desc '
    *Usage:*

      <pre><code>
        <r:general_setting key="room_text" />
      </code></pre>

    Note that
      * :key is a required option.
      * If the key does not exist then a blank string is returned
  '
  tag "general_setting" do |tag|
    GeneralSetting[tag.attr['key']]
  end

end
