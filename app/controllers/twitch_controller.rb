require 'net/http'

class TwitchController < ApplicationController
  private

  # GET /brrr
  def brrr
    @is_printing = printing?
    @is_alive = alive?
    @job_name = job_name
  end

  #################
  # Boolean getters
  def printing?
    data = '/api/connection'
    data['current']['state'] == 'Printing'
  end

  def alive?
    data = get '/api/connection'
    data['current']['state'] != 'Closed'
  end

  def job_name
    data = get '/api/job'
    data['job']['file']['name'].split('.')[0]
  end
  #################

  # Internal stuff
  def get(route)
    resp = send_request route
    return false if resp.class == Integer or data.has_key?('error')

    return JSON.parse resp.body.gsub('=>', ':')
  end

  def send_request (route, content='', type='GET', headers={})
    tries = 5
    key = ENV['OCTOPRINT_APIKEY']
    url = ENV['OCTOPRINT_URL']
    host = url.include?('://') ? url.split('://')[1] : url
    _headers = { "Host" => host,
                 "X-Api-Key" => key }
    _headers = _headers.merge(headers)
    uri = URI.parse("#{url}#{route}")
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
end
