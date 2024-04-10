instance creation
certPath: aCertPathString
keyPath: aKeyPathString
  "Create an instance configured with TLS information.
  configured with a cert and unencrypted key."

  ^self
    certPath: aCertPathString
    keyPath: aKeyPathString
    keyPassphrasePath: nil "unencrypted key"
    cipherList: nil "default cipher list"
    yourself