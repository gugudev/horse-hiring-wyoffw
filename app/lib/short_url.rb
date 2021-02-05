class ShortUrl

  KEY_LENGTH = 5.freeze

  def self.encode(url)
    registry = self.register_url(url)

    registry[:key]
  end

  private

  def self.register_url(url)
    raise 'URL must be present' unless url

    registry = MemoryBuffer.find_by_url(url) || MemoryBuffer.insert(new_registry(url))
    
    registry
  end

  def self.new_registry(url)
    { key: SecureRandom.uuid[0..KEY_LENGTH], url: url }
  end

end