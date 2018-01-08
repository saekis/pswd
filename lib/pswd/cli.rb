module Pswd
  class CLI < Thor
    default_command :search

    desc 'search', 'search password by domain'
    def search(domain = nil)
      if domain.nil?
        abort('Please input domain')
      else
        search = Commands::Search.new(domain).run
        abort('password not found') if search.login_id.nil? || search.password.nil?
        puts("login_id: #{search.login_id}")
        puts("password: #{search.password}")
      end
    end

    desc 'register', 'register password'
    def register
      Commands::Register.new.run
    end

    desc 'version', 'version'
    def version
      puts Pswd::VERSION
    end
  end
end