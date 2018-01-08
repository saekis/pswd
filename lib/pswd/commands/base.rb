module Pswd
  module Commands
    class Base
      attr_accessor :json_io, :domain, :login_id, :password

      def initialize
        @json_io = Pswd::Json.new(Pswd.json_path)
      end
    end
  end
end