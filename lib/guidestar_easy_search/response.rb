module GuidestarEasySearch
  class Response
    attr_accessor :status, :message, :organizations, :full_response, :exception

    def initialize
      begin
        guidestar_response = yield
        @organizations = guidestar_response.organizations
        @status = 'success'
        @message = 'success'
        @message = 'success'
        @full_response = guidestar_response
      rescue => e
        @organizations = []
        @status = 'failure'
        @exception = e
        @message = e.message
      end
    end
  end
end
