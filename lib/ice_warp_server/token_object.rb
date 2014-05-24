module IceWarpServer
  class TokenObject < IceWarpServer::BaseObject

    attr_accessor :url

    def initialize
      @token ||= IceWarpServer.icewarp_apiobjectcall('0', '', 'IceWarpServer.TokenObject','','')

    end

    def url=(url)
      @url = api('URL',url)
    end

    def counter # READONLY
      api('Counter')
    end
    def token_handle # READONLY
       api('TokenHandle')
    end
  end

end