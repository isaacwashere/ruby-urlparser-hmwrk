class UrlParser

  def initialize(new_url)
    @new_url = new_url
  end

  def scheme
    @new_url.split("://").first
  end

  def domain
    @new_url.split("//").last.split(/(?<=.com)/).first
  end

  def port
    bool = @new_url.split("//").last.split("/").first.include?(":")
    if !bool
      if self.scheme == "https"
        s_port = "443"
      else
        s_port = "80"
      end
    else
       s_port = @new_url.split("//").last.split(":").last.split("/").first
    end

    return s_port

  end

  def path
    paz = @new_url.split("//").last.split(":").last.split("/").last.split("?").first
    paz = paz if paz != ""
  end

  def query_string
    @new_url.split("//").last.split(":").last.split("/").last.split("?").last.split("#").first.split("&").map{|n| n.split("=")}.to_h
  end

  def fragment_id
    @new_url.split("//").last.split(":").last.split("/").last.split("?").last.split("#").last
  end


end
