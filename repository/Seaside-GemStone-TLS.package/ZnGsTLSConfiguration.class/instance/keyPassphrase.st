accessing
keyPassphrase
  "Returns the passphrase specified in keyPassphrasePath.
  If no path is specified, returns nil."

  ^keyPassphrasePath
    ifNotNil:
      [:path | | file |
      file := GsFile openReadOnServer: path.
      [file contents] ensure: [file close]]