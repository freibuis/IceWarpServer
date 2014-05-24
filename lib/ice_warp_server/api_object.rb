####
#
# CreateTables, DropTables, CheckDBConnection not included ***Dangerous***
#
#


module IceWarpServer

  class ApiObject < IceWarpServer::BaseObject
    attr_reader :token, :version
    attr_accessor :token_handle

    def initialize
      new_api_token
      # reload_services
    end



    def token
      @token ||= new_api_token
    end

    def token_handle=(token_handle)
      @token_handle = IceWarpServer.icewarp_apiobjectcall(token, 'TokenHandle', token_handle,'','')
    end


    def new_api_token
      @token = IceWarpServer.icewarp_apiobjectcall('0', 'Create', 'IceWarpServer.APIObject','','')
    end

# Returns the whole list of domains as an array.
    def get_domain_list
      domain_list = api('GetDomainList')
      domain_list.split(";")
    end

    #Renames an old domain to the new domain name.
    def rename_domain(domain_from, domain_to)
      response = api("RenameDomain", domain_from, domain_to)
    end


    # Deletes an existing domain with all its accounts.
    def delete_domain(domain)
      api("DeleteDomain", domain)
    end

    # Returns the number of all domains on the IceWarp Email Server.
    def get_domain_count

      response = api('GetDomainCount')
      Integer(response)

    end

    def version
      @version ||= ("GetProperty", 'c_version')
    end

    # The Done function closes the COM object and frees the allocated data. It also saves the changed settings if any.
    # The function is called automatically when the COM object is freed.
    def done
      api('Done')
    end

    def save
      api('Save')
    end

    def get_property(property)
      value = api('GetProperty', property)
    end

    def set_property(property)
      value = api('SetProperty', property)
    end


    #Notifies all of the running services of any new changes to the settings. This is required for global settings changed.
    def update_configuration
      api('UpdateConfiguration')
    end

    # The ReloadServices restarts SMTP and POP3 service.
    # To restart all services use function Start(stAll) from the IceWarp::StatisticsObject object
    def reload_services
      api('ReloadServices')
    end

    # The Backup and Restore functions are identical to the IceWarp Email Server administration interface backup and restore
    # features.
    # They let you backup and restore the IceWarp Email Server settings. The Path parameter specifies the complete file name of
    # the destination backup file
    def backup_config(path)
      api("BackupConfig", path)
    end

    # The Backup and Restore functions are identical to the IceWarp Email Server administration interface backup and restore
    # features.
    # They let you backup and restore the IceWarp Email Server settings. The Path parameter specifies the complete file name of
    # the destination backup file
    def restore_config(path, password)
      api("RestoreConfig", path, password)

    end

    # This function takes care of indexing the spam and genuine messages. The Email is the account email address to be indexed.
    # If empty the global spam and genuine messages will be indexed.
    def spam_index_now(email)
      api("SpamIndexNow", email)
    end

    #The Domain parameter specifies the name of the domain to be opened
    # Once the instance returned use the Domain Token functions and properties
    # Use the open_domain function to edit an existing domain.
    def open_domain(domain)
      api("OpenDomain", domain)
    end

    #The Domain parameter specifies the name of the domain to be created
    # Once the instance returned use the Domain Token functions and properties
    # Use the open_domain function to edit an existing domain.
    def new_domain(domain)
      domain_token = api("NewDomain", domain)
    end

    # Returns the position of the domain in the list. If not found a negative number will be returned.
    def get_domain_index(domain)
      domain_token = api("GetDomainIndex", domain)
    end

    #The LastErr property specifies the numeric value of the last function result. See the result description in the Introduction.

    # Returns the schedule object for the specified variable.
    def get_schedule(command)
      api("GetSchedule", command)
    end

    # Sets the schedule data from the schedule object for the given variable.
    def set_schedule(command)
      api("SetSchedule", command)
    end

    #Retrieves the user statistics. From and To are date indicators, filter can contain email patterns.
    def get_user_statistics(from, to, filter)
      raw_stats = api("GetUserStatistics", from, to, filter)
      header, *details =raw_stats.split("\n")
      header = header.split(",")
      stats = []
      details.each do |detail|
        items = []
        detail.split(",").each_with_index do |item, index|
          item = item.split(";") if header[index] == "[Alias]"
          items <<{header[index].sub("[", "").sub("]", "").sub(" ", "_").downcase.to_sym => item}
        end
        stats << items
      end
      stats
    end

    #GetFileList
    #
    # Returns Array of files
    def get_file_list(folder, recursive = false)
      raw_list = api("GetFileList", folder, recursive)
      raw_list.split("\n").map { |file| file.chop }
    end

    #GetFolderList
    #
    # Returns Array of folders
    def get_folder_list(folder, recursive = false)
      raw_list = api("GetFolderList", folder, recursive)
      raw_list.split("\n").map { |folder| folder.chop }
    end

    #function GetMessageContent(const FileName: WideString; const Type_: WideString; MaxSize: Integer; MaxLines: Integer):
    #WideString; dispid 263;
    def get_message_content(file_name, file_type, max_size = 0, max_lines = 0)
      api("GetMessageContent", file_name, file_type, max_size, max_lines)
    end

  end
end
