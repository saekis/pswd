module Pswd
  class HashBuilder
    class << self
      def build(hash, domain, id, password)
        hash.store(domain, {}) unless hash.key?(domain)
        hash[domain][id] = password
        hash
      end
    end
  end
end