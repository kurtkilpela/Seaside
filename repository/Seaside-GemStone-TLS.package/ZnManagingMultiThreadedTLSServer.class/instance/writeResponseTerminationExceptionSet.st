accessing
writeResponseTerminationExceptionSet
  "Return the set of exceptions which, when they occur while reading a request,
  are interpreted as equivalent to a timeout or connection close."

  ^super writeResponseTerminationExceptionSet
    add: SocketError;
    add: SecureSocketError;
    yourself