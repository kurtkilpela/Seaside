instance creation
certPath: aCertPathString
keyPath: aKeyPathString
keyPassphrasePath: aKeyPassphrasePathString
cipherList: aCipherListString
  "Create an instance configured with TLS information.
  A nil keyPassphrasePath indicates the key is not encrypted.
  A nil cipherList indicates that the default OpenSSL cipher
  list should be used."

  ^self new
    certPath: aCertPathString;
    keyPath: aKeyPathString;
    keyPassphrasePath: aKeyPassphrasePathString;
    cipherList: aCipherListString;
    yourself