require 'uri'
require 'json'
require 'fileutils'
require 'thor'
require 'highline'
require 'pswd/cli'
require 'pswd/version'
require 'pswd/domain'
require 'pswd/json'
require 'pswd/hash_builder'
require 'pswd/commands/base'
require 'pswd/commands/search'
require 'pswd/commands/register'

module Pswd
  class << self
    def json_path
      "#{Dir.home}/tools/.pswd/password.json"
    end
  end
end