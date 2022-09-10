# frozen_string_literal: true

module TwitchHelper
  #################
  # Boolean getters
  def printing?
    data = get '/api/connection'
    data['current']['state'] == 'Printing'
  end

  def alive?
    data = get '/api/connection'
    state = data['current']['state']
    puts state
    state != 'Closed'
  end

  def job_name
    data = get '/api/job'
    name = data['job']['file']['name']
    unless name == nil
      name.split('.')[0]
    else
      nil
    end
  end
  #################

  def get(route)
    resp = send_request route
    begin
      JSON.parse resp.gsub('=>', ':')
    rescue => e
      warn e
    end
  end

  def send_request(route, _content = '', type = 'GET', headers = {})
    tries = 5
    key = ENV.fetch('OCTOPRINT_APIKEY', nil)
    url = ENV.fetch'OCTOPRINT_URL', nil)
    host = url.include?('://') ? url.split('://')[1] : url
    headers = { 'Host' => host,
                'X-Api-Key' => key }.merge(headers)

    # TODO refactor
    headers_arr = []
    headers.each { |k,v| headers_arr.append "-H #{[k,v].join ':'}" }
    res = `curl -s -L #{url}#{route} #{headers_arr.join ' '}`
    res
  end
end
