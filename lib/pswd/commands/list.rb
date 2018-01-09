module Pswd
  module Commands
    class List < Base
      def initialize
        super()
      end

      def run
        @json_io.hash.keys
      end
    end
  end
end