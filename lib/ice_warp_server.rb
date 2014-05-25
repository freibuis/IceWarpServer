require 'ffi'
require "ice_warp_server/api_lib"
require "ice_warp_server/connection"
require 'ice_warp_server/base_object'
require 'ice_warp_server/base_properties'
require "ice_warp_server/version"
require "ice_warp_server/token_object"
require "ice_warp_server/api_object"
require "ice_warp_server/domain_object"
require "ice_warp_server/acount_object"
require "ice_warp_server/remote_account_object"
require "ice_warp_server/schedule_object"
require "ice_warp_server/statistics_object"
require "ice_warp_server/groupware"




module IceWarpServer


  extend FFI::Library
  ffi_convention :stdcall

  begin
  ffi_lib IceWarpServer.api_lib
  attach_function :icewarp_apiobjectcall, [:string, :string, :string, :string, :string], :string
  rescue LoadError
    warn "Could Not Load IceWarp api file: #{IceWarpServer.api_lib}\n Please add IceWarpServer::Connection.api_lib_location = "
  end



end

class String
  def to_bool
    return true if self == true || self =~ (/^(true|t|yes|y|1)$/i)
    return false if self == false || self.blank? || self =~ (/^(false|f|no|n|0)$/i)
    raise ArgumentError.new("invalid value for Boolean: \"#{self}\"")
  end
end
