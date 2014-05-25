module IceWarpServer


  def self.create_api_connection
    extend FFI::Library
    ffi_convention :stdcall

    begin
      ffi_lib IceWarpServer.api_lib
      attach_function :icewarp_apiobjectcall, [:string, :string, :string, :string, :string], :string
    rescue LoadError
      warn "Could Not Load IceWarp api file: #{IceWarpServer.api_lib}\n Please add IceWarpServer::Connection.api_lib_location = "
    end

  end



end