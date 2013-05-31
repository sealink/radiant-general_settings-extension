class GeneralSetting < ActiveRecord::Base
  
  validates_uniqueness_of :key, :message => "Key has already been used."
  
  def self.[](key)
    self.find_by_key(key.to_s).try(:value)
  end

end
