instance creation
register: aName
for: aServerClass
on: anArrayOfPortNumbersOrResourceNames
tlsConfig: aZnGsTLSConfiguration
  "Create an instance configured with TLS information."

  | instance |
  instance := self
    createServerOfClass: aServerClass
    withName: aName
    on: anArrayOfPortNumbersOrResourceNames.
  instance
    tlsConfig: aZnGsTLSConfiguration;
    register.
  ^instance