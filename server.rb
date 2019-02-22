require 'socket'

server = TCPServer.new(2345)

connected = true
while connected == true
  socket = server.accept

  socket.puts "What do you say?"

  they_said = socket.gets.chomp

  connected = false if they_said == "quit"

  socket.puts "You said: #{they_said}. Goodbye!"

  socket.close
end
