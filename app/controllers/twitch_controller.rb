# frozen_string_literal: true

require 'net/http'

class TwitchController < ApplicationController
  include TwitchHelper

  # GET /brrr
  def brrr
    query
    @is_printing = printing?
    @is_alive = alive?
    @job_name = job_name
  end

  private
  #################
  # Custom errors #
  #################
  class EnvironmentException < StandardError
  end

  ########
  # Init #
  ########
  def query
    @connection = get '/api/connection'
    @job = get '/api/job'
  end

  ###################
  # Boolean getters #
  ###################
  def printing?
    @connection == nil ? false : @connection['current']['state'] == 'Printing'
  end

  def alive?
    @connection == nil ? false : @connection['current']['state'] != 'Closed'
  end

  def job_name
    def name(n)
      n == nil ? "<no_job>" : n.split('.')[0..-2].join('.')
    end

    @job == nil ? "<no_job>" : name(@job['job']['file']['name'])
  end

  ################
  # HTTP related #
  ################
  def get(route)
    begin
      resp = send_request route
      JSON.parse resp.gsub('=>', ':')
    rescue => e
      warn e
      nil
    end
  end

  def send_request(route, _content = '', type = 'GET', headers = {})
    tries = 5
    key = ENV.fetch('OCTOPRINT_APIKEY', nil)
    url = ENV.fetch('OCTOPRINT_URL', nil)
    if key == nil or url == nil
      raise EnvironmentException.new "Octoprint envvar not loaded"
    end

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
