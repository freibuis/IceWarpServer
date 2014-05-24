module IceWarpServer
  class BaseObject
    attr_reader :token

    def api (arg1="", arg2="", arg3="", arg4="")

      IceWarpServer.icewarp_apiobjectcall(@token, arg1, arg2, arg3, arg4)

    end


    def last_err
      error = api("LastErr")
      Integer(error)
    end


  end
end
