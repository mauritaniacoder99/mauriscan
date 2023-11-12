require 'socket'

def scan_port(host, port)
  begin
    socket = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM, 0)
    sockaddr = Socket.sockaddr_in(port, host)

    socket.connect(sockaddr)

    puts " ✔✔ Port #{port} is open on #{host} ✔✔"
  rescue StandardError
    puts " ✖✖ Port #{port} is closed on #{host} ✖✖"
  ensure
    socket.close if socket
  end
end

# Usage
puts "[*] Enter the website URL (e.g., example.com):"
host = gets.chomp

puts "[*] Enter the starting port:"
start_port = gets.chomp.to_i

puts "[*] Enter the ending port:"
end_port = gets.chomp.to_i

(start_port..end_port).each do |port|
  scan_port(host, port)
end
