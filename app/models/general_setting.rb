class GeneralSetting < ActiveRecord::Base

  validates_uniqueness_of :key, :message => "Key has already been used."
  
  def self.[](key)
    fetch(key, nil)
  end

  # Like Hash#fetch
  # Returns a value from the settings for the given key. 
  #
  # If the key can’t be found, there are several options: 
  #   With no other arguments, it will raise an KeyError exception; 
  #   if default is given, then that will be returned; 
  #   if the optional code block is specified, then that will be run and its result returned.
  def self.fetch(*args)
    raise KeyError, "No key given to find" if args.size == 0

    key     = args[0]
    default_given = args.size > 1
    default = args[1] if default_given

    item = find_by_key(key.to_s)
    if item
      return item.value
    end

    return yield(key) if block_given?
    return default if default_given
    raise KeyError, "Setting key #{key} not found"
  end
end
