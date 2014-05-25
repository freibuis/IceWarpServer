module IceWarpServer
  module Connection
    attr_accessor :host, :port,  :username, :password ,:api_lib_location
    attr_reader :url
    extend self


    def configuration(&value)

      @host = "127.0.0.1"
      @port = 80
      @api_lib_location = "../"
      instance_eval &value
    end

    def url
      "#{username}:#{password}@#{host}:#{port}"
    end

    def remote?
      (@host == '127.0.0.1' or @host = "localhost".downcase) ? false : true
    end


  end
end

