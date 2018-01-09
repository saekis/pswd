module Pswd
  module Requires
    module Register
      def domain
        HighLine.new.ask('domain: ')
      end
      module_function :domain

      def login_id
        HighLine.new.ask('user name or email: ')
      end
      module_function :login_id

      def password
        HighLine.new.ask('password: ') { |q| q.echo = '*' }
      end
      module_function :password
    end
  end
end