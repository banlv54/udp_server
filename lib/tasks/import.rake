require 'socket'

namespace :import do
  desc "Start udp"
  task udp_server: :environment do
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
  end
end