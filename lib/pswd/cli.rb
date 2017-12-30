module Pswd
  class CLI < Thor
    default_command :main

    desc 'main', 'main process'
    def main
      p 'test'
    end
  end
end