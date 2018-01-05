module Pswd
  class CLI < Thor
    default_command :main

    desc 'main', 'search password by domain'
    def main
      print 'domain: '
      print Domain.extract(gets.chomp)
    end

    desc 'register', 'register password'
    def register
      path = "#{Dir.home}/tools/.pswd/password.json"
      json_io = JsonIo.new(path)

      print 'domain: '
      Domain.extract(gets.chomp)

      print 'user name or email: '
      login_id = gets.chomp

      password = HighLine.new.ask('password: ') { |q| q.echo = '*' }

      hash = json_io.hash()
      hash.store(domain, {}) unless hash.key?(domain)
      hash[domain][login_id] = password
      json_io.dump(hash)
    end

    desc 'version', 'version'
    def version
      puts Pswd::VERSION
    end
  end
end
