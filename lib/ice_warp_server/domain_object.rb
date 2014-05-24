module IceWarpServer


  class DomainObject < IceWarpServer::BaseObject
    include IceWarpServer::BaseProperties

    attr_reader :domain, :api_object


    def initialize(api_object)
      @api_object ||= api_object

      new_token('IceWarpServer.DomainObject')

      unless @api_object.token_handle == nil
        self.token_handle(api_object.token_handle)
      end
    end





    def api_object
      @api_object
    end

    def self.open(api_object, domain)

      domain_object ||= self.new(api_object, domain)
      domain_object.open(domain)
    end

    def open(domain)
      @domain = domain
      api("Open", domain).to_bool
    end

    def domain
      @domain
    end

    def new(domain)
      @domain = domain
      new_token
      api("New", domain).to_bool
    end

    #When editing an existing domain you can delete it by calling this function. The domain must be properly loaded.
    def delete
      api("Delete")
    end

    #The Name property lets you read or set the Name of the domain you want to create or save.
    def name
      api("Name")
    end

    def ipaddress
      api("IPAddress")
    end

    def save
      api("Save").to_bool
    end

    #Returns the whole domain list of all account aliases separated with semicolon.
    def get_account_list
      account_list = api("GetAccountList")
      account_list.split(";")
    end

    #Returns the number of all accounts in the domain.
    def get_account_count
      account_count = api("GetAccountCount")
      Integer(account_count)
    end

    #Deletes an existing account. The Email parameter can be either a complete email address or just an alias.
    def delete_account(email_address)
      api("DeleteAccount", email_address).to_bool
    end

    def delete_account_id(id)
      api("DeleteAccountID", id).to_bool
    end

    #Return the account's alias specified by the Index in the account list.
    def get_account(index)
      api("GetAccount", index)
    end

    #Use the OpenAccount function to edit an existing account.
    def open_account(email_address)
      api("OpenAccount", email_address)
    end

    #The NewAccount lets you add a new account.
    def new_account(email_address)
      api("NewAccount", email_address)
    end

    #Tries to find the alias in the domain. If found the index will be returned. If not a negative number will be returned.
    def get_account_index_by_alias(email_address)
      index = api("GetAccountIndexByAlias", email_address)
      Integer(index)
    end

    def apply_template(template_name)
      api("ApplyTemplatet", template_name).to_bool
    end

  end

end