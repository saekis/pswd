module Pswd
  class Domain
    def self.extract(url)
      URI.parse(url).host || url
    end
  end
end