module Pswd
  module Requires
    module Search
      def index
        HighLine.new.ask('index: ')
      end
      module_function :index
    end
  end
end