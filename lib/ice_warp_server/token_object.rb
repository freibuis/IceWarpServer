module IceWarpServer
  class TokenObject < IceWarpServer::BaseObject

    attr_accessor :url

    def initialize(url='')

      new_token('IceWarpServer.TokenObject')

      unless url == ''
       self.url = url
      end

    end

    def url=(url)
       api('URL',url)
    @url = url
    end
    def url
      api('URL')
    end


    def counter # READONLY
      api('Counter')
    end

  end

end