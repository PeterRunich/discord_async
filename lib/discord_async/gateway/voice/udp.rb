# frozen_string_literal: true

require 'rbnacl'
require 'opus-ruby'

module DiscordAsync
  module Gateway
    module Voice
      class UDP
        attr_reader :ssrc, :tmp

        def initialize(ip, port, ssrc)
          @tmp = []

          @ip = ip
          @port = port
          @ssrc = ssrc

          @endpoint = Async::IO::Endpoint.udp(ip, port.to_i)
          @socket = @endpoint.connect

          @opus = Opus::Encoder.new(48_000, 960, 2)

          @sequence = 0 # TODO: Если интеджер переполнится сбросить
          @timestamp = 0 # TODO: Если интеджер переполнится сбросить
        end

        def send(buffer)
          header = [0x80, 0x78, @sequence, @timestamp, @ssrc].pack('CCnNN')
          encoded_buffer = @opus.encode buffer, 1920
          p encoded_buffer.size
          @tmp << encoded_buffer
          crypted_buffer = @box.box(header.ljust(24, "\0"), encoded_buffer)

          @socket.send(header + crypted_buffer, 0)

          @sequence += 1
          @timestamp += 960
        end

        def send_opus(buffer)
          header = [0x80, 0x78, @sequence, @timestamp, @ssrc].pack('CCnNN')
          encoded_buffer = buffer
          crypted_buffer = @box.box(header.ljust(24, "\0"), encoded_buffer)

          @socket.send(header + crypted_buffer, 0)

          @sequence += 1
          @timestamp += 960
        end

        def secret_key=(value)
          @secret_key = value
          @box = RbNaCl::SecretBoxes::XSalsa20Poly1305.new(@secret_key.pack('C*'))
        end

        def ip_discovery
          msg = [@ssrc].pack('N') + "\0" * 66
          @socket.send msg, 0

          msg = @socket.recv(4096)
          ip = msg[4..-3].delete("\0")
          port = msg[-2..].unpack1('n')

          [ip, port]
        end
      end
    end
  end
end
