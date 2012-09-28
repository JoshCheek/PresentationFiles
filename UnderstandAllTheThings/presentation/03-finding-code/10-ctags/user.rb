class Client
  def initialize(url)
    @url = url
  end

  def user
    JSON.parse HttpAdapter.get(@url + "/user.json")
  end
end
