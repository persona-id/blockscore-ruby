module BlockScore
  class Fingerprint
    def initialize(resource, body)
      @resource = resource
      @body = Util.parse_json(body)
    end

    def data
      @data ||= begin
        if resource_index?
          body.fetch(:data)
        else
          body
        end
      end
    end

    def resource
      if watchlist_search?
        'watchlist_search'
      elsif watchlist_hits?
        'watchlist_hit'
      else
        @resource
      end
    end

    private

    attr_reader :body

    # candidates#search endpoint
    def watchlist_search?
      body.respond_to?(:key?) && body.key?(:matches)
    end

    # hash style list format
    def resource_index?
      body.is_a?(Hash) && list_object?
    end

    def list_object?
      body[:object].eql?('list')
    end

    def watchlist_hits?
      data.first.is_a?(Hash) && data.first.key?(:matching_info)
    end
  end
end
