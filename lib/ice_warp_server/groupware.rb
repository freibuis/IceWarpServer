module IceWarpServer


  class Groupware < IceWarpServer::BaseObject
    attr_reader :api_object

    def initialize(api_object=nil)

      @api_object = api_object

      new_token('IceWarpServer.Groupware')

      unless @api_object.token_handle == nil
        self.token_handle(api_object.token_handle)
      end

    end

    def function_call(parm1='', parm2='', parm3='')
      api("FunctionCall", parm1, parm2, parm3)
    end
    def connect(server,ssl=false)
      api("Connect", server,ssl.to_s).to_bool
    end

    def disconnect
      api("Disconnect").to_bool
    end


  end

end