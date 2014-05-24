module IceWarpServer

  class RemoteAccountObject < IceWarpServer::BaseObject

    attr_reader :domain, :api_object

    def initialize(api_object=nil)

      @api_object = api_object

      new_token('IceWarpServer.RemoteAccountObject')

      unless @api_object.token_handle == nil
        self.token_handle(api_object.token_handle)
      end

    end


    def open(index)
      api("Open", index)
    end

    def new(remote_account)
      api("New", remote_account)
    end

    def delete(remote_account)
      api("Delete", remote_account)
    end

    def delete_index(index)
      api("DeleteIndex", index)
    end

    def save
      api("Save")
    end

    def count
      api("Count")
    end

    def get_schedule (schedule)
      api("GetSchedule",schedule)
    end

    def set_schedule (schedule)
      api("SetSchedule",schedule)
    end

    def apply_template (template)
      api("ApplyTemplate",template)
    end

    def get_property(property)
      api("GetProperty", property)
    end

    def set_property(property, value)
      api("SetProperty", property, value)
    end

  end

end
