class Rest < ActiveResource::Base
  self.site = 'http://jcms.localhost:80/texts/'
  self.timeout = 5
end
