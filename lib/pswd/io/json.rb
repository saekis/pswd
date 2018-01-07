module Pswd
  module Io
    class Json
      attr_reader :path

      def initialize(path)
        @path = path
        create unless File.exist?(path)
      end

      def hash
        open(@path) do |file|
          json = file.read
          if json.nil? || json == ''
            {}
          else
            JSON.parse(json)
          end
        end
      end

      def search(key)
        json_hash = hash
        json_hash.key?(key) ? json_hash[key] : nil
      end

      def generate_hash(domain, id, password)
        json_hash = hash
        json_hash.store(domain, {}) unless json_hash.key?(domain)
        json_hash[domain][id] = password
        json_hash
      end

      def dump(hash)
        open(@path, 'w') do |io|
          JSON.dump(hash, io)
        end
      end

      def create
        dirname = File.dirname(@path)
        FileUtils.mkdir_p(dirname) unless File.directory?(dirname)
        open(@path, 'w') { |json| json.puts(JSON.generate({})) }
      end
    end
  end
end
