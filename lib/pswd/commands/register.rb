module Pswd
  module Commands
    class Register < Base
      def initialize
        super()
      end

      def run
        domain = Domain.extract(Requires::Register.domain)
        login_id = Requires::Register.login_id
        password = Requires::Register.password
        hash = HashBuilder.build(@json_io.hash, domain, login_id, password)
        @json_io.dump(hash)
      end
    end
  end
end