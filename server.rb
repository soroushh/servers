require 'socket'


class Notelist

  attr_reader :name

  def initialize(name)
    @name = name
  end

end

server = TCPServer.new(2345)

connected = true
while connected == true
  socket = server.accept

  socket.puts "What do you say?"

  they_said = socket.gets.chomp

  notelist = Notelist.new(they_said)

  connected = false if they_said == "quit"

  socket.puts "The object's name was #{notelist.name}"

  socket.close
end
