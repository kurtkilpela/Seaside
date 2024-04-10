testing
requiresClassTLSConfiguration
  "Due to 50900, a full certification chain is only loaded
  when configuring certificates using class methods. This
  was fixed in 3.6.9+ and 3.7.1+. Instance methods are
  used in supported versions."

  ^true
