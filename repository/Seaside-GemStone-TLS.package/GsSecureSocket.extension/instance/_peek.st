*Seaside-GemStone-TLS
_peek
  "Returns a SmallInteger in the range 0..255 if there is a byte available
   from the underlying SSL buffer for the socket, otherwise returns nil."

  "Workaround for bug 50937"

  | result |
  result := self _zeroArgSslPrim: 20.
  self class clearErrorQueue.
  ^result