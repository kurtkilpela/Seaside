instance creation
register: aName
tlsConfig: aZnGsTLSConfiguration
  "Create and register an instance configured
  with the provided ZnGsTLSConfiguration."

  ^self
    register: aName
    for: self serverClass
    on: self defaultPortOrResourceNameList
    tlsConfig: aZnGsTLSConfiguration