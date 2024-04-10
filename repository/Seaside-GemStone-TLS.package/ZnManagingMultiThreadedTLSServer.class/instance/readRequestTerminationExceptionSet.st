accessing
readRequestTerminationExceptionSet
  "Return the set of exceptions which, when they occur while reading a request,
        are interpreted as equivalent to a timeout or connection close."

  ^super readRequestTerminationExceptionSet
    add: SocketError;
    add: SecureSocketError;
    yourself