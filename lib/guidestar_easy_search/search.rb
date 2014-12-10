module GuidestarEasySearch
  class Search
    attr_accessor :ein, :keyword, :limit

    def initialize(options = {})
      @ein = options[:ein]
      @keyword = options[:keyword]
      @limit = options[:limit] || 6

      validate_credentials or raise GuidestarEasySearch::Error::InvalidCredentials.new("A username and password are required")
      validate_options or raise GuidestarEasySearch::Error::OptionNotPresent.new("Either the 'ein' or 'keyword' option must be specified")
    end

    def search!
      GuidestarEasySearch::Response.new { ein ? by_ein : by_keyword }
    end

    private

    def by_ein
      Guidestar.detailed_search(ein: ein)
    end

    def by_keyword
      Guidestar.detailed_search(keyword: keyword, limit: limit)
    end

    def validate_options
      ein || keyword
    end

    def validate_credentials
      Guidestar.username && Guidestar.password
    end
  end
end
