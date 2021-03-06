# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ice_warp_server/version'

Gem::Specification.new do |spec|
  spec.name          = "ice_warp_server"
  spec.version       = IceWarpServer::VERSION
  spec.authors       = ["Freibuis"]
  spec.email         = ["freibuis@gmail.com"]
  spec.summary       = %q{Ruby IceWarpServer Interface}
  spec.description   = %q{Ruby IceWarpServer Interface using api.dll or libapi.so}
  spec.homepage      = "https://github.com/freibuis/IceWarpServer"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'ffi', '~> 1.9.3'
end
