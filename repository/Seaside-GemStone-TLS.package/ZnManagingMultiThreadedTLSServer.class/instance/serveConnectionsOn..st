handling-connections
serveConnectionsOn: listeningSocketTransientStackValue
  "We wait up to acceptWaitTimeout seconds for an incoming connection.
  If we get one we wrap it in a SocketStream and #executeRequestResponseLoopOn: on it"

  | stream socket |
  (listeningSocketTransientStackValue value readWillNotBlockWithin: self acceptWaitTimeout)
    ifFalse: [^self noteAcceptWaitTimedOut].
  socket := TransientStackValue value: listeningSocketTransientStackValue value accept.
  self requiresClassTLSConfiguration
    ifFalse:
      [socket value
        useCertificateFile: tlsConfig certPath
        withPrivateKeyFile: tlsConfig keyPath
        privateKeyPassphrase: tlsConfig keyPassphrase].
  tlsConfig cipherList ifNotNil: [:cl | socket value setCipherListFromString: cl].
  (socket value secureAcceptTimeoutMs: self secureAcceptWaitTimeout errorOnTimeout: false)
    ifFalse:
      [self log debug: 'TLS secureAccept failed.'.
      socket value close].
  self log debug: 'Established secure connection to client'.
  stream := TransientStackValue value: (self socketStreamOn: socket value).
  [
    self log debug: 'Executing request/response loop'.
    ZnCurrentServer
     value: self
     during: [ self executeOneRequestResponseOn: stream ]
  ]
    forkAt: Processor lowIOPriority
    named: self workerProcessName