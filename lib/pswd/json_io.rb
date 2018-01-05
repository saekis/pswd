module Pswd
  class JsonIo
    attr_reader :path

    def initialize(path)
      @path = path
      create_json_file(path) unless File.exist?(path)
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

    def dump(hash)
      open(@path, 'w') do |io|
        JSON.dump(hash, io)
      end
    end

    def create_json_file(path)
      dirname = File.dirname(path)
      FileUtils.mkdir_p(dirname) unless File.directory?(dirname)
      open(path, 'w') { |json| json.puts(JSON.generate({})) }
    end
  end
end
