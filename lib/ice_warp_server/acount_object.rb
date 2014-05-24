module IceWarpServer
  class AccountObject < IceWarpServer::BaseObject
    include IceWarpServer::BaseProperties

    attr_reader :api_object, :email



    def initialize(api_object=nil)

      @api_object = api_object

      new_token('IceWarpServer.DomainObject')

      unless @api_object.token_handle == nil
        self.token_handle(api_object.token_handle)
      end

    end

    def self.open(api_object, email)
      @email ||= email
      account_object ||= self.new(api_object)
      account_object.open(email)
      account_object
    end

    def open(email)
      @email = email
      api("Open", email)
    end

    def new(email)
      @email = email
      @domain = api("New", email)
    end

    #The email address of the current user.
    def email_address
      api("EmailAddress")
    end

    def aliases
      aliases = api("GetProperty", "U_Alias").split(";")
    end

    #You can delete an existing account you are editing by calling the Delete function.
    def delete
      api("Delete")
    end


    def save
      api("Save")
    end

    #The AuthenticateUser function lets you check and load the user specified by the Username, Password

    def authenticate_user(username, password)
      api("AuthenticateUser", username, password)
    end

    def validate_user(username, password)
      api("ValidateUser", username, password)
    end

    #Converts all messages in the mailbox path of the account IMAP to POP3 and POP3 to IMAP.
    def mailbox_convert_messages(mailbox_path, from_imap = false)
      api("MailboxConvertMessages", mailbox_path, from_imap)
    end

    def get_user_groups(user)
      groups = api("GetUserGroups", user)
      groups.split(";\n")
    end

    def get_listfile_contents
      get_property("M_ListFile_contents").split("\n").each { |email| email.split(";")[0] }
    end

    # These functions let you loop through all accounts in the domain. It is not recommended to use the GetDomainCount and loop
    # thru each account based on the Index. That would be too slow. Use these functions instead.
    def find_init(domain)
      accounts = api("FindInit", domain)
      if accounts =~ (/^(true|t|yes|y|1)$/i)
        true
      else
        false
      end
    end

    def find_init_query(domain, query)
      accounts = api("FindInitQuery", domain, query)
      if accounts =~ (/^(true|t|yes|y|1)$/i)
        true
      else
        false
      end
    end

    def find_next
      accounts = api("FindNext")
      if accounts =~ (/^(true|t|yes|y|1)$/i)
        true
      else
        false
      end
    end

    def find_done
      api("FindDone")
    end


    #The LastErr property specifies the numeric value of the last function result. See the result description in the Introduction.
    def last_err
      api("LastErr")
    end
  end
end
