module IceWarpServer
  module BaseProperties


    def get_properties(*properties)
      if properties.count == 1
        api("GetProperty", properties)
      else
        values = []
        properties.each do |property|
          values.push api("GetProperty", property)
        end
        cmd
      end
    end

    def get_property(property)
      api("GetProperty", property)
    end

    def set_property(property, value)
      api("SetProperty", property, value)
    end
  end

end