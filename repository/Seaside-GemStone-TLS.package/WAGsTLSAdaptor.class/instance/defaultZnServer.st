accessing
defaultZnServer
  "Create a server with the configured TLSConfiguration."

  ^ZnManagingMultiThreadedTLSServer
    on: port
    tlsConfig: tlsConfig