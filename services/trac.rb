class Service::Trac < Service
  def receive_push
    http.url_prefix = data['url']
    http_post "github/#{data['token']}", :payload => payload.to_json
  rescue Faraday::Error::ConnectionFailed
    raise_config_error "Connection refused. Invalid server URL."
  end
end
