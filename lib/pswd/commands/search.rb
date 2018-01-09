module Pswd
  module Commands
    class Search < Base
      def initialize(domain)
        super()
        @domain = domain
        @accounts = @json_io.search(domain)
        @login_id = nil
        @password = nil
      end

      def run
        keys = @accounts.keys
        case keys.length
        when 0 then nil
        when 1
          define_account(keys[0])
        else
          define_account(select_account)
        end
        self
      end

      def select_account
        login_id = Requires::Search.login_id(@accounts)
        abort('invalid number') unless login_id
      end

      def define_account(login_id)
        accounts = @json_io.search(@domain)
        @login_id = login_id
        @password = accounts[login_id]
      end
    end
  end
end