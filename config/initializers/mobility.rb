Mobility.configure do |config|
  config.plugins do
    backend :container

    active_record
    reader
    writer

    locale_accessors [ :fr, :en ]

    query
    cache
    dirty
    presence
  end
end
