module Pswd
  module Requires
    module Search
      def index
        HighLine.new.ask('index: ')
      end
      module_function :index

      def login_id(accounts)
        puts('which account?')
        accounts.keys.each_with_index { |id, index| puts("#{index}. #{id}") }
        index = Requires::Search.index.to_i
        accounts.keys[index]
      end
      module_function :login_id
    end
  end
end