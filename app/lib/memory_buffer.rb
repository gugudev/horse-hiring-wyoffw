class MemoryBuffer
  include Singleton

  @@registries = []

  def self.all_registries
    @@registries
  end

  def self.insert(key:, url:)
    new_registry = { key: key, url: url }
    @@registries << new_registry

    new_registry
  end

  def self.find_by_key(key)
    @@registries.find{|registry| registry[:key] == key }
  end

  def self.find_by_url(url)
    @@registries.find{|registry| registry[:url] == url }
  end

end
