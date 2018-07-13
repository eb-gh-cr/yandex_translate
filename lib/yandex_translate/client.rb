require 'restclient'

module YandexTranslate
  class Client
    def initialize args = {}
      raise YandexTranslate::Exception.new('Api key is required') unless args[:key]
      @key = args[:key]
    end

    # params: ui
    def get_langs(params = {})
      send_request({ method: 'getLangs' }, params)
    end

    # params: text, lang, format, options
    def detect(params = {})
      send_request({ method: 'detect' }, params)
    end

    # params: text, hint
    def translate(params = {})
      send_request({ method: 'translate' }, params)
    end

    private

    BASE_URL = 'https://translate.yandex.net/api/v1.5/tr.json/'

    def send_request(request = {}, params = {})
      params[:key] = @key
      begin
        result = RestClient.post(
          File.join(BASE_URL, request[:method]), params
        )
        JSON.parse(result)
      rescue RestClient::Exception => e
        raise YandexTranslate::Exception.new(
                "Request error: #{e.http_code} #{e.response.body}"
              )
      end
    end
  end
end
