require 'net/http'

class TwitchController < ApplicationController
  @@SECRET = '/private/octoprint/secrets.txt'
  @@BASE_URL = 'https://print.chocorp.net'

  def load_key
    file = File.open(File.join(Rails.root, @@SECRET), 'r')
    file.read.split[0].split('=')[1]
  end  

  def send_request (route, content='', type='GET', headers={})
    tries = 5
    key = load_key
    _headers = { "Host" => "print.chocorp.net",
                 "X-Api-Key" => "#{load_key}" }
    _headers = _headers.merge(headers)
    uri = URI.parse("#{@@BASE_URL}#{route}")
    while tries > 0
      begin
        Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
          case type
          when 'GET'
            req = Net::HTTP::Get.new(uri.request_uri, initheader=_headers)
          end
          return http.request req
        end
      rescue OpenSSL::SSL::SSLError
        tries -= 1
      rescue Errno::EHOSTUNREACH
        return -2
      end
    end
    warn "Unable to verify target SSL certificate"
    return -1
  end

  def printing?
    resp = send_request('/api/connection')
    return false if resp.class == Integer

    data = JSON.parse resp.body.gsub('=>', ':')
    data['current']['state'] == 'Printing'
  end

  def alive?
    resp = send_request('/api/connection')
    return false if resp.class == Integer

    data = JSON.parse resp.body.gsub('=>', ':')
    data['current']['state'] != 'Closed'
  end

  def job_name
    resp = send_request '/api/job'
    return false if resp.class == Integer

    data = JSON.parse resp.body.gsub '=>', ':'
    data['job']['file']['name'].split('.')[0]
  end

  def brrr
    @is_printing = printing?
    @is_alive = alive?
    @job_name = job_name
  end
end
