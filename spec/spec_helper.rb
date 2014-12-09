require_relative '../lib/guidestar_easy_search'

class FakeGuidestarResponse
  def organizations
    [{name: "some organization", ein: "12345678"}]
  end
end

def guidestar_successful_response
  FakeGuidestarResponse.new
end

def guidestar_exception
  raise Guidestar::InternalServerError.new("A bad thing happened.")
end