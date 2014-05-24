# IceWarpServer

This is a re-write of the original IceWarpApi that was here on github (deleted). The old verision use standard lib XMLRPC::Client. Unfortunately this was slow and painful to work with.

This rewrite uses IceWarpServer .dll's/.so files using the FFI gem(https://github.com/ffi/ffi) to talk directly to the  IcewarpServer API. This is much faster and removes the heavy lifting.

You will need to drop the api.dll (windows) or libapi.so (linux) into the project root folder. Linux might require so OS level dependencies which I will list later. 
The dll/so files are not included in this project. You can grab them from

  C:\Program Files\IceWarp\api.dll    windows 32 ruby
  C:\Program Files\IceWarp\api_64.dll Windows 64bit Ruby  (copy and rename to api.dll)
  /opt/icewarp/lib/libapi.so          Linux

## Usage

Most commands can be take from the api pdf http://www.icewarp.com/download/documentation/server/API/V%2011%20IceWarp%20Server%20API%20Reference.pdf. but have been ruby-ifed 

Example: Get Domain Count
```ruby
api = IceWarpServer::ApiObject.new
api,get_domain_count
```

Example: Get Domain List
```ruby
api = IceWarpServer::ApiObject.new
api,get_domain_list
This will return and array of domains (api returns string. helper makes it enum array)
```

Example Get Server Verison
```ruby
api = IceWarpServer::ApiObject.new
api,get_property('c_version')
or shorthand
api.version
```


use the Icewarp server Api PDF for more information on usable properties



Note: To connect from a remote machine will require the use of the TokenObject then bind its token handle with all objects



auth string = administrator ":" password "@" server
```ruby
auth = "system_account:securepass@myipaddress"
token_object = IceWarpServer::TokenObject.new
token_object.url = auth
api = IceWarpServer::ApiObject.new
api.token_handle = token_object.token_handle # apply token object handle to api token
```



## TODO

The Following Objects need to be mapped
 
DomainObject

AccountObject
  
RemoteAccountObject

StatisticsObject
 
Mailer

IMMessage
 
IDP

Groupware
 
ChallengeResponse
 

SSL support with the token object coming later.

ApiObject Chaining will come soon (eg: api.token_object.token_handle,api.domain_object,get_account_list)

detect from configuration if its local or remote. if remote automagically apply use the TokenObject

## Installation

Add this line to your application's Gemfile:

    gem 'ice_warp_server' , :git => 'git://github.com:freibuis/IceWarpServer.git'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ice_warp_server

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/freibuis/ice_warp_server/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
6. Smile!
