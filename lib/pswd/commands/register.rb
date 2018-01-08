module Pswd
  module Commands
    class Register < Base
      def initialize
        super()
      end

      def run
        domain = Domain.extract(HighLine.new.ask('domain: '))
        login_id = HighLine.new.ask('user name or email: ')
        password = HighLine.new.ask('password: ') { |q| q.echo = '*' }
        hash = @json_io.generate_hash(domain, login_id, password)
        @json_io.dump(hash)
      end
    end
  end
end