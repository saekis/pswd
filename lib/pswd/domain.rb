module Pswd
  class Domain
    def self.extract(url)
      url = 'http://' + url unless url.match?(/^http.*/)
      URI.parse(url).host || url
    end
  end
end