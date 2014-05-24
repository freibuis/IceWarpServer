module IceWarpServer

  class StatisticsObject < IceWarpServer::BaseObject
    include IceWarpServer::BaseProperties
    attr_reader :api_object

    def initialize(api_object=nil)

      @api_object = api_object

      new_token('IceWarpServer.StatisticsObject')

      unless @api_object.token_handle == nil
        self.token_handle(api_object.token_handle)
      end

    end

    def is_running(service)
      api("IsRunning", service)
    end

    def reset(service)
      api("Reset", service)
    end

    def poll(service)
      api("Poll", service)
    end

    def start(service)
      api("Start", service)
    end

    def stop(service)
      api("Stop", service)
    end

    def get_sessions(service, history)
      api("GetSessions", service, history)
    end
=begin
    IsRunning(const Service: WideString): WordBool; dispid 201;
    Reset(const Service: WideString): WordBool; dispid 202;
    Poll(const Service: WideString): WordBool; dispid 203;





=end


  end

end