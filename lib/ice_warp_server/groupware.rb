module IceWarpServer


  class Groupware < IceWarpServer::BaseObject
    attr_reader :api_object

    def initialize(api_object=nil)

      @api_object = api_object

      new_token('IceWarpServer.StatisticsObject')

      unless @api_object.token_handle == nil
        self.token_handle(api_object.token_handle)
      end

    end

    def func_name(parm1='', parm2='', parm3='',parm4='')
      api("FuncName", parm1, parm2, parm3,parm4)
    end
    def connect(server,ssl=false)
      api("Connect", server,ssl.to_s).to_bool
    end

    def disconnect
      api("Disconnect").to_bool
    end
=begin
    function FunctionCall(const FuncName: WideString; const Param1: WideString; const Param2: WideString; const Param3:
                                                                                                                    WideString; const Param4: WideString): WideString; safecall;
    function Connect(const Server: WideString; SSL: WordBool): WordBool; safecall;
    function Disconnect: WordBool; safecall;
=end

  end

end