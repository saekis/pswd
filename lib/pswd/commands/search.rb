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
        when 0 then self
        when 1
          define_account(keys[0])
        else
          define_account(select_account)
        end
        self
      end

      def select_account
        puts('which account?')
        @accounts.keys.each_with_index { |id, index| puts("#{index}. #{id}") }
        index = HighLine.new.ask('index: ').to_i
        login_id = @accounts.keys[index]
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