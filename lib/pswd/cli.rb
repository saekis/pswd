module Pswd
  class CLI < Thor
    default_command :search

    desc 'search', 'search password by domain'
    def search
      json_io = Pswd::Json.new(Pswd.json_path)
      domain = Domain.extract(HighLine.new.ask('domain: '))
      accounts = json_io.search(domain)
      keys = accounts.keys
      abort('account not found.') if keys.length.zero?
      if keys.length > 1
        puts('which account?')
        keys.each_with_index { |id, index| puts("#{index}. #{id}") }
        index = HighLine.new.ask('index: ').to_i
        unless account = keys[index]
          abort('invalid number')
        end
      else
        account = keys[0]
      end
      puts('')
      puts("id: #{account}")
      puts("password: #{accounts[account]}")
    end

    desc 'register', 'register password'
    def register
      json_io = Pswd::Json.new(Pswd.json_path)
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