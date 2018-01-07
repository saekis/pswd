module Pswd
  class JsonIo
    attr_reader :path

    def initialize(path)
      @path = path
      create unless File.exist?(path)
    end

    def json_hash
      open(@path) do |file|
        json = file.read
        if json.nil? || json == ''
          {}
        else
          JSON.parse(json)
        end
      end
    end

    def generate_hash(domain, id, password)
      hash = json_hash
      hash.store(domain, {}) unless hash.key?(domain)
      hash[domain][id] = password
      hash
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
