require 'nfc'
require 'pp'

# EXEC: ruby -I lib test.rb

# Create a new context
ctx = NFC::Context.new

# Open the first available USB device
dev = ctx.open nil

loop do  

  nfc = {
    # Get the UID as a hex string
    id_str: dev.select.to_s,
    # Get the unique ID for this tag
    uid: dev.select.uid,
    # Get the ATS for this tag
    ats: dev.select.ats,
    # Get the atqa
    atqa: dev.select.atqa,
    # Inspect this tag
    inspect: dev.select.inspect
  }

  pp nfc

  sleep(0.8)
end