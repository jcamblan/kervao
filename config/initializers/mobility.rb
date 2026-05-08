Mobility.configure do |config|
  config.plugins do
    backend :container

    active_record
    reader
    writer

    query
    cache
    dirty
    presence
  end
end
