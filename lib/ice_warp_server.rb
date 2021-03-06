require 'ffi'
require "ice_warp_server/api_lib"
require 'ice_warp_server/base_object'
require 'ice_warp_server/base_properties'
require "ice_warp_server/version"
require "ice_warp_server/token_object"
require "ice_warp_server/api_object"
require "ice_warp_server/domain_object"
require "ice_warp_server/acount_object"
require "ice_warp_server/remote_account_object"
require "ice_warp_server/schedule_object"



module IceWarpServer


  extend FFI::Library
  ffi_convention :stdcall

  ffi_lib IceWarpServer.api_lib
  attach_function :icewarp_apiobjectcall, [:string, :string, :string, :string, :string], :string


end
