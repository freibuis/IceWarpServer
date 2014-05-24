module IceWarpServer

  def self.api_lib
    if ENV['OS'] = "Windows_NT"
      "api.dll"
    else
      "libapi.so"
    end
  end

end