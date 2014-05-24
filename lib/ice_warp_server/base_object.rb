module IceWarpServer
  class BaseObject
    attr_reader :token

    def api (arg1="", arg2="", arg3="", arg4="")

      IceWarpServer.icewarp_apiobjectcall(@token, arg1, arg2, arg3, arg4)

    end

    def token
      @token ||= new_api_token
    end
    def new_token (object)
      @token = IceWarpServer.icewarp_apiobjectcall('0', 'Create', object, '', '')
    end


    #Every Object has a token_handle! deal with it.
    def token_handle(token_handle='')
      api('TokenHandle', token_handle)

    end

    def last_err
      error = api("LastErr")
      Integer(error)
    end


  end
end
