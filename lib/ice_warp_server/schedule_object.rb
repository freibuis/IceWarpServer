module IceWarpServer

  class ScheduleObject < IceWarpServer::BaseObject
    include IceWarpServer::BaseProperties
    attr_reader :api_object


    def initialize(api_object=nil)

      @api_object = api_object

      new_token('IceWarpServer.ScheduleObject')

      unless @api_object.token_handle == nil
        self.token_handle(api_object.token_handle)
      end

      def add
        api("Add")
      end

      def delete(index)
        api("Delete", index)
      end

      def select(index)
        api("Select", index)
      end
      def count
        api("Count")
      end
      def data
        api("Data")
      end

    end

  end
end

