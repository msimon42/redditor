class VpnService
  def connect(address)
      @address = address
      system(
        %x{
            osascript <<APPLESCRIPT
            tell application "Tunnelblick"
	             connect "#{@address}"
	             get state of first configuration where name = "#{@address}"
	             repeat until result = "CONNECTED"
		              delay 1
		              get state of first configuration where name = "#{@address}"
	             end repeat
            end tell
            APPLESCRIPT}
      )

    return `Connected to #{address}`
  end

  def disconnect
    raise 'No connection exists' unless @address
    system(
      %x{
          osascript <<APPLESCRIPT
          tell application "Tunnelblick"
             disconnect "#{@address}"
          end tell
          APPLESCRIPT}
    )
    @address = nil
    return 'Disconnected'
  end

  def switch(address)
    raise 'No connection exists' unless @address
    self.disconnect
    self.connect(address)
    return `Connected to #{address}`
  end
end
