module Pswd
  class CLI < Thor
    default_command :search

    desc 'search', 'search password by domain'
    def search(url)
      search = Commands::Search.new(url).run
      puts("domain: #{search.domain}")
      abort('Account not found') if search.login_id.nil? || search.password.nil?
      puts("login_id: #{search.login_id}")
      puts("password: #{search.password}")
    end

    desc 'register', 'Register password'
    def register
      Commands::Register.new.run
      puts('Password registered!')
    end

    desc 'list', 'display domaim list'
    def list
      domains = Commands::List.new.run
      if domains.length.zero?
        abort('Nothing is registered yet.')
      else
        domains.each { |domain| puts(domain) }
      end
    end

    desc 'version', 'version'
    def version
      puts Pswd::VERSION
    end
  end
end