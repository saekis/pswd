module Pswd
  class CLI < Thor
    default_command :main

    desc 'main', 'search password by domain'
    def main
      path = "#{Dir.home}/tools/.pswd/password.json"
      json_io = Io::Json.new(path)
      domain = Domain.extract(HighLine.new.ask('domain: '))
      accounts = json_io.search(domain)
      p accounts.keys
    end

    desc 'register', 'register password'
    def register
      path = "#{Dir.home}/tools/.pswd/password.json"
      json_io = Io::Json.new(path)

      domain = Domain.extract(HighLine.new.ask('domain: '))
      login_id = HighLine.new.ask('user name or email: ')
      password = HighLine.new.ask('password: ') { |q| q.echo = '*' }
      hash = json_io.generate_hash(domain, login_id, password)
      json_io.dump(hash)
    end

    desc 'version', 'version'
    def version
      puts Pswd::VERSION
    end
  end
end