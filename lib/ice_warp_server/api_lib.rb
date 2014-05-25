module IceWarpServer

  def self.api_lib

    IceWarpServer::Connection.api_lib_location ||=  File.join(File.expand_path('./'))
    base_loc = IceWarpServer::Connection.api_lib_location

    if ENV['OS'] == "Windows_NT"
      File.join(base_loc,"api.dll")
    else
      File.join(base_loc,"libapi.so")
    end
  end

end
