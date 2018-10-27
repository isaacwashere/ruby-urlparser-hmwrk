class Test
  attr_reader :new_url

def initialize(new_url)
  @new_url = new_url
end

def no_more
p  @new_url.split("//").last.split(":").last.split("/").last.split("?").first
end



end



setup = Test.new "http://www.google.com/search?q=cat&name=Tim#img=FunnyCat"
setup.no_more
