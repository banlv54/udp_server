require 'socket'
Thread.new do
  socket = UDPSocket.new
  socket.bind('0.0.0.0', 1991)
  while true
    data = socket.recvfrom(255).first
    latitude, longitude = data.split ','
    Location.create(latitude: latitude,
                    longitude: longitude)
  end
end
