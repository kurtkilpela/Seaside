accessing
addSocket: aWebSocket

	mutex critical: [ sockets add: aWebSocket ]