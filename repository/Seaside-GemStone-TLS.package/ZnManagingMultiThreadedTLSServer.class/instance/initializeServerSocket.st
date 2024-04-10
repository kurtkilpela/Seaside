initializing
initializeServerSocket
  "Set up a new TLS server socket and listen on it."

  | defaultBacklog |
  self _setNoStubbing.        "as long as I am in memory prevent stubbing of my instance variables ... I will stay in memory as long as I am referenced from stack.."
  defaultBacklog := 500.
  self log debug: 'Initialize TLS server socket'.
  self requiresClassTLSConfiguration
    ifTrue:
      [GsSecureSocket
        useServerCertificateFile: tlsConfig certPath
        withPrivateKeyFile: tlsConfig keyPath
        privateKeyPassphrase: tlsConfig keyPassphrase].
  serverSocket := TransientStackValue value: GsSecureSocket newServerIpv6. "Do not persist server socket on commit."
  serverSocket value
    makeServer: defaultBacklog atPort: self port.
  self log debug: 'Initialize TLS server socket completed'