# frozen_string_literal: true

require 'net/http'

class PagesController < ApplicationController
  # GET /mcmods
  def mcmods
    @mods = Mod.all
  end

  # GET /resume
  def cv; end

  # GET /happynothappy
  def hnh; end

  # POST /happynothappy
  def hnh_r
    # reCAPTCHA
    resp = params['g-recaptcha-response']
    secret = ENV.fetch('CAPTCHA_SECRET', nil)
    uri = URI.parse('https://www.google.com/recaptcha/api/siteverify')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.path, { 'Content-Type' => 'application/x-www-form-urlencoded' })
    request.body = "secret=#{secret}&response=#{resp}"
    response = http.request(request)
    render status: :bad_request if JSON.parse(response.body)['success'] != true

    addr = params[:contact]
    msg = params[:content]
    msg_p = 'msg'
    fn = Time.zone.now.strftime('%Y-%m-%d_%H:%M:%S.%L.txt')
    begin
      Dir.mkdir(msg_p) unless File.exist?(msg_p)
      File.write("#{msg_p}/#{fn}", "From: #{addr}\n#{msg}")
    rescue StandardError => e
      raise e unless Rails.env.production?

      Rails.logger.debug e
      render status: :internal_server_error
    end
  end
end
